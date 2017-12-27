class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def index
  end

  def scraper
    ScraperJob.perform_async
  end
end
