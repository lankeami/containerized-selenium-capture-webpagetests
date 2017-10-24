 require 'watir'
# require 'headless'

class WebPageTestJob < ApplicationJob
  queue_as :default

  def _create_wpts(args)
    Wpt.create args
  end

  def _load_and_wait(browser, url, &block)
    browser.goto url unless url.nil?
    wait_loop = true
    begin
      begin
        #Watir::Wait.until{browser.execute_script('return jQuery.active == 0')}
        Watir::Wait.until{block.call}
        wait_loop = false
      rescue Watir::Wait::TimeoutError
      rescue Watir::Exception::UnknownObjectException
      rescue Exception => e
        wait_loop = false
        p "e: #{e.message}"
        raise
      end
    end while wait_loop
  end

  def perform(*args)
    # Do something later
    url = args[0]
    puts "url: #{url.class}"
    raise(ArgumentError, "Invalid URL") unless url.is_a? Url

    puts "Initiating a chrome browser"
    browser = Watir::Browser.new :chrome
    puts "loading webpagetest.org"    
    browser.goto "https://www.webpagetest.org/" 
    puts "initiating test for '#{url.url}'"
    browser.text_field(id: 'url').set url.url
    puts "submitting test"
    browser.button(type: 'submit').click
    puts "waiting for test to complete"

    _load_and_wait(browser, nil) {
      browser.button(type: 'submit').value.include? "Re-run the test" 
    }

    puts "test completed, iterating through waterfalls"
    test_result_url = browser.url
    unless browser.url.end_with? "waterfall_view_step1"
      (1..3).each do |i|
        _load_and_wait(browser, "#{test_result_url}#{i}/details/#waterfall_view_step1") {
          browser.execute_script('return jQuery.active == 0')
        }
        begin
          puts "saving waterfall view ##{i}"
          wpt_data = {}
          wpt_data["url_id"] = url.id
          wpt_data["load_t"] = (browser.td(id: "LoadTime").text.chomp('s') rescue nil)
          wpt_data["first_byte_t"] = (browser.td(id: "TTFB").text.chomp('s') rescue nil)
          wpt_data["request_count"] = (browser.td(id: "Requests").text.chomp('s') rescue nil)
          wpt_data["speed_index"] = (browser.td(id: "SpeedIndex").text.chomp('s') rescue nil)
          wpt_data["ref"] = browser.url
          wpt_data["document_complete_t"] = (browser.td(id: "DocComplete").text.chomp('s') rescue nil)
          wpt_data["dom_interactive_t"] = (browser.table(id: "tableW3CTiming").tr(index: 1).td(index: 2).text.chomp('s'))
          puts "Data: #{wpt_data}"
          _create_wpts wpt_data
        rescue
        end
      end
    end

    puts "tests completed"
    browser.quit
  end
end
