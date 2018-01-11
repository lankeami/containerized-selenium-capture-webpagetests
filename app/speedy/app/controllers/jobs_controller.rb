class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def index
  end

  def scraper
    ScraperJob.perform_async
  end

  def klass_async
    params[:klass].constantize.perform_async
  end
end
