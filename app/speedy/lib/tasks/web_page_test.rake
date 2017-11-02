namespace :web_page_test do
  desc "Iterate through all Urls and trigger a WebPageTest for each"
  task get_all: :environment do
    Url.all.each do |u|
      begin
        WebPageTestJob.new.perform(u)
      rescue
      end
    end
    puts "Web Page Test data capture complete"
  end

end
