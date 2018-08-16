#!/bin/sh

DDDDD=yourstudentid
upass=yourpassword
DDDDD2=anotherstudentid
upass2=anotherpassword

content=$(curl -s 'https://lgn.bjut.edu.cn/' --data 'DDDDD='${DDDDD}'&upass='${upass}'&v46s=1&v6ip=&f4serip=172.30.201.2&0MKKey=')

#echo "${content}"

msg=$(echo "$content"|grep -o '^Msg=[0-9][0-9]')
gno=$(echo "$content"|grep -o '^Gno=[0-9][0-9]')
#echo ${msg}
#echo ${gno}

if [ "$gno" == "Gno=01" ]; then
    echo "login_success"
else
    echo "first login fail"
    echo ${gno}
    echo ${msg}
    content2=$(curl -s 'https://lgn.bjut.edu.cn/' --data 'DDDDD='${DDDDD2}'&upass='${upass2}'&v46s=1&v6ip=&f4serip=172.30.201.2&0MKKey=')
    msg2=$(echo "$content2"|grep -o '^Msg=[0-9][0-9]')
    gno2=$(echo "$content2"|grep -o '^Gno=[0-9][0-9]')

    if [ "$gno2" == "Gno=01" ]; then
        echo "login_success"
        echo ${gno2}
    else
        echo ${gno2}
        echo ${msg2}
        echo "login_fail"
    fi
fi
