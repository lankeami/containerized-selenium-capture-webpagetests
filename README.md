# Speedy
Speedy is a Selenium based framework to aggregate and report on web page speed tests.

## How does Speedy work?
Speedy logs the following metrics from [WebPageTest](https://www.webpagetest.org/) for a particular url.
* Load Time
* First byte
* Speed Index
* Dom Interactive
* Document Complete
* Number of requests

## How do I run it?
1. Start the web server
   ```
   docker-compose up web
   ```
1. Navigate to [localhost:8080/urls](http://localhost:8080/urls)
1. Add whichever URL you want to start tracking
1. Perform the tests
   ```
   docker-compose up --force-recreate --build scrape
   ```
1. Export the data to a CSV file
   ```
   docker-compose up --force-recreate --build sqlite3-dump
   ```
1. Open the CSV file
   ```
   cd app && open web_page_test_data.csv
   ```

