# while read old_line
# do
#   echo "${old_line}"
#   new_line="${old_line#title}"
#   if [ "${new_line}" != "${old_line}" ]
#   then
#     echo "${new_line}"
#     break
#   fi
# done < $1

# if [ $1 = "all" ]
# then
#   for filename in *.md
#   do
#     old=$(sed -n "3p" ${filename})
#     new="${old#updated}"
#     if [ "${new}" = "${old}" ]
#     then
#       sed -i '' -e '3i \
#       updated: 0' ${filename}
#     fi
#   done
# else
#   old=$(sed -n "3p" $1)
#   new="${old#updated}"
#   updated="updated: "$(date "+%s")
#   if [ "${new}" != "${old}" ]
#   then
#     sed -i '' -e '3c \
#     '${updated} $1
#   else
#     echo $new
#     sed -i '' -e '3i \
#     '${updated} $1
#   fi
#   vi $1
# fi

version=$(uname)
if [ "${version}" = "Linux" ]
then
  echo "${version}"
  for filename in ~/blog/source/_posts/*.md
  do
    changed=$(git diff ${filename})
    changed_num=${#changed}
    if [ ${changed_num} -ge 10 ]
    then
      echo ${filename}
      echo "changed: " ${changed_num}
      old=$(sed -n "3p" ${filename})
      new="${old#updated}"
      updated="updated: "$(date "+%s") # 1907年至今的秒数
      if [ "${new}" != "${old}" ] # 有updated项
      then
        echo "${filename}" "has updated tab"
        sed -i -e '3c\'${updated} ${filename}
      else # 没有updated项
        echo "${filename}" "no updated tab"
        sed -i -e '3i\'${updated} ${filename}
      fi
    fi
  done
elif [ "${version}" = "Darwin" ]
then
  echo "${version}"
  for filename in ~/blog/source/_posts/*.md
  do
    changed=$(git diff ${filename})
    changed_num=${#changed}
    if [ ${changed_num} -ge 10 ]
    then
      echo ${filename}
      echo "changed: " ${changed_num}
      old=$(sed -n "3p" ${filename})
      new="${old#updated}"
      updated="updated: "$(date "+%s") # 1907年至今的秒数
      if [ "${new}" != "${old}" ] # 有updated项
      then
        echo "${filename}" "has updated tab"
        sed -i '' -e '3c \
        '${updated} ${filename}
      else # 没有updated项
        echo "${filename}" "no updated tab"
        sed -i '' -e '3i \
        '${updated} ${filename}
      fi
    fi
  done
fi
