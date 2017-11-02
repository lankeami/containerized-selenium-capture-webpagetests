#!/bin/bash

sqlite3 -header -csv /var/speedy/app/speedy/db/development.sqlite3 "select a.title, b.*, date(b.created_at) as date from urls a join wpts b on a.id=b.url_id" > /var/speedy/app/web_page_test_data.csv
