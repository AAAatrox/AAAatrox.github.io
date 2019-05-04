if [ "$1"x = x ]
then
  echo "\033[1;31mneed message\033[0m"
else
  # 切换目录
  cd "./source"
  echo "\033[1;33m[\033[0m"
  echo $PWD
  ls "../node_modules/" > npm_list
  echo "\033[1;33m]\033[0m"

  echo "\033[1;32mAdding...\033[0m"
  git add -A
  git commit -m $1
  echo "\033[1;33mPushing...\033[0m"
  if [ "$2"x != x ]
  then
    echo "\033[1;33m[\033[0m"
    git remote "-v"
    git ls-files
    echo "\033[1;33m]\033[0m"
    echo "\033[1;33mTo markdown branch\033[0m"
    git push origin md
  else
    echo "\033[1;35mAbort\033[0m"
  fi
  # 返回目录
  cd ".."
fi

