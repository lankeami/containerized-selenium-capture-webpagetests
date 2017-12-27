class ScraperJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Url.all.each do |u|
      begin
        puts Time.now
        WebPageTestJob.new.perform(u)
      rescue
      end
    end
  end
end
