curl -u $(cat ./config/myoauthtoken):x-oauth-basic -X POST -d '{"name":"tmp_clock_repo","description":"these commits make a fun clock"}' https://api.github.com/user/repos
