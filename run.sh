#!/bin/bash
. ./delete_that_repo.sh
. ./create_new_repo.sh
. ./reset_history.sh
. ./create_commit_history.sh
cd ~/tmp_clock_repo
git add .
git commit -m "Adding project files"
git push -u origin master
