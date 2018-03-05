USERNAME=$(cat ./config/mygithubname)
PREV_DIR=$(pwd)
cd ~/tmp_clock_repo
rm -rf ./.git
git init
git remote add origin ssh://git@github.com/$USERNAME/tmp_clock_repo.git
cd $PREV_DIR
