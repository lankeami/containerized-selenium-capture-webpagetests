class MobileWebPageTestJob < WebPageTestJob
  queue_as :default

  def _client
    "iPhone8 iOS 11"
  end
end
