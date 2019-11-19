#!/bin/sh

DDDDD=
upass=
DDDDD2=
upass2=
DDDDD3=
upass3=

# 0 ipv4&ipv6 1 ipv4 2 ipv6
v46s=0

if [ "$1" == 6 ]; then
    echo "ipv6"
    v46s=2
elif [ "$1" == 4 ]; then
    echo "ipv4"
    v46s=1
else
    if [ ${v46s} == 2]; then
        echo "ipv6"
    else
        echo "ipv4"
fi

if [ "$v46s" == 2 ]; then
    lgn=https://lgn6.bjut.edu.cn/
else
    lgn=https://lgn.bjut.edu.cn/
fi

#curl ${lgn}

#content=$(curl -s 'https://lgn6.bjut.edu.cn/' --data 'DDDDD='${DDDDD}'&upass='${upass}'&v46s='${v46s}'&v6ip=&f4serip=172.30.201.2&0MKKey=')
content=$(curl -s ${lgn} --data 'DDDDD='${DDDDD}'&upass='${upass}'&v46s='${v46s}'&v6ip=&f4serip=172.30.201.2&0MKKey=')

#echo "${content}"

msg=$(echo "$content"|grep -o '^Msg=[0-9][0-9]')
gno=$(echo "$content"|grep -o '^Gno=[0-9][0-9]')

if [ "$gno" == "Gno=01" ]; then
    echo "login_success"
else
    echo "first login fail"
    echo ${msg}
    echo ${gno}
    content2=$(curl -s ${lgn} --data 'DDDDD='${DDDDD2}'&upass='${upass2}'&v46s='${v46s}'&v6ip=&f4serip=172.30.201.2&0MKKey=')
    msg2=$(echo "$content2"|grep -o '^Msg=[0-9][0-9]')
    gno2=$(echo "$content2"|grep -o '^Gno=[0-9][0-9]')

    if [ "$gno2" == "Gno=01" ]; then
        echo "login_success"
    else
        echo ${msg2}
        echo ${gno2}
        echo "login_fail"
        content3=$(curl -s ${lgn} --data 'DDDDD='${DDDDD3}'&upass='${upass3}'&v46s='${v46s}'&v6ip=&f4serip=172.30.201.2&0MKKey=')
        msg3=$(echo "$content3"|grep -o '^Msg=[0-9][0-9]')
        gno3=$(echo "$content3"|grep -o '^Gno=[0-9][0-9]')
        if [ "$gno3" == "Gno=01" ]; then
            echo "login_success"
        else
            echo ${msg3}
            echo ${gno3}
            echo "login_fail"
        fi
    fi
fi
