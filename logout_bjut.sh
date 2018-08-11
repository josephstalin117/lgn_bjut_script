#!/bin/sh
content=$(curl -s 'https://lgn.bjut.edu.cn/F.htm' \
    -XGET \
    -H 'Referer: https://lgn.bjut.edu.cn/' \
    -H 'Host: lgn.bjut.edu.cn' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
    -H 'Connection: keep-alive' \
    -H 'Accept-Language: en-us' \
    -H 'Accept-Encoding: br, gzip, deflate' \
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/604.3.5 (KHTML, like Gecko) Version/11.0.1 Safari/604.3.5') 
#echo "${content}"
echo "log out success"
