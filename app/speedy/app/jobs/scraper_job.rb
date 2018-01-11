class ScraperJob
  include SuckerPunch::Job
  #queue_as :default

  def klass
    "WebPageTestJob"
  end

  def perform(*args)
    Url.all.each do |u|
      begin
        puts Time.now
        klass.constantize.new.perform(u)
      rescue
      end
    end
  end
end
