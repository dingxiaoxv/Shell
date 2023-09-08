#!/bin/sh

# cnt=0
# while [ $cnt -lt 3 ]
# do
#     let cnt++
#     echo "test $cnt" > tmp.log
# done

# 检查文件是否存在
if [ -f "sn.txt" ]; then
    # 使用cut命令截取第10和第11个字符
    result=$(cut -c 10-11 sn.txt | tr 'a-z' 'A-Z')
    echo "截取的字符串是: $result"
else
    echo "文件 sn.txt 不存在。"
fi
