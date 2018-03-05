curl -u $(cat ./config/myoauthtoken):x-oauth-basic -X DELETE https://api.github.com/repos/$(cat ./config/mygithubname)/tmp_clock_repo
