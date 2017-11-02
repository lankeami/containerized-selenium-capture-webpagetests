#!/bin/bash
#!/bin/bash

bundle install
/opt/bin/entry_point.sh &
sleep 10
rake web_page_test:get_all
