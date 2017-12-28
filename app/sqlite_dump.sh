#!/bin/bash

sqlite3 -header -csv /var/speedy/app/speedy/db/development.sqlite3 "select a.title, b.url_id, avg(b.load_t) as load_t, avg(b.first_byte_t) as first_byte_t, avg(b.dom_interactive_t) as dom_interactive_t, avg(b.document_complete_t) as document_complete_t, avg(b.request_count) as request_count, avg(b.speed_index) as speed_index, date(b.created_at) as date from urls a join wpts b on a.id=b.url_id group by a.title, b.url_id, date(b.created_at)" > /var/speedy/app/web_page_test_data.csv
