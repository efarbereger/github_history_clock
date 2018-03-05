ruby create_time_template.rb > mytime.tpl
./github_board.py -r ~/tmp_clock_repo -t ./mytime.tpl -e $(cat ./config/myemail) -a center
