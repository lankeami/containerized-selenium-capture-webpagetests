class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def index
  end

  def scraper
    ScraperJob.new.perform
  end
end
