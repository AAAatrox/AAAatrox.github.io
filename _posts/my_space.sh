# 将tab转换成2个space
line_num=$(wc -l $1)
echo ${line_num}
i=0
while [ ${line_num:${i}:1} != " " ]
do
  ((i++))# 寻找空格
done
line_num=${line_num:0:${i}}
echo ${line_num}
version=$(uname)
if [ "${version}" = "Linux" ]
then
  sed -i 's/\t/  /g' $1
elif [ "${version}" = "Darwin" ]
then
  sed -i '' 's/	/  /g' $1
fi
