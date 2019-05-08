message=$1

if [ "$message"x = x ]
then
  echo "need message"
else
  if [ "$2"x != x ]
  then
    zsh source/_posts/my_sort.sh # 第二个参数执行排序
    echo "\033[1;36m=====\nBackup .md files\033[0m"
    zsh source/my_update.sh $1 $2 # 第二个参数只是让my_update.sh push的,没有实际含义
    echo "\033[1;36mBackup finish!\n=====\033[0m"
  else
    echo "\033[1;36mNo backup for md\n=====\033[0m"
  fi
  if [ "$2"x != "yx" ] # 不进行部署
  then
    sleep 1
    hexo cl
    hexo g -d

    git checkout master
    git add .
    git commit -m "${message}"
    git checkout backup
    git merge master
    git push origin backup
    git checkout master
  else
    echo "\033[1;34mwon't deploy\033[0m"
  fi
fi
