#!/bin/bash
#
# IMPORTANT: Change this file only in directory Standalone!

bundle install
/opt/bin/entry_point.sh &
sleep 10
rails s
