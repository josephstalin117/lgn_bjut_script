# lgn_bjut_script

适用于校内使用linux服务器登录网关的脚本

#### 用法

1. 修改login_bjut.sh中的`DDDDD`和`upass`，分别填入账号和密码，`DDDDD2`和`upass2`可填入另外一个账号，作为备用账号使用，主号停机时备用账号可以替代备用账号登录
2. 设置login_bjut.sh中的`v46s`的值可以选择ipv6登录和ipv4登录，`0`代表ipv4和ipv6登录，`1`代表ipv4，`2`代表ipv6登录
3. 使用 `bash login_bjut.sh`命令登录网关，提示`success`证明登录成功
4. 退出网关使用`bash logout_bjut.sh`退出网关
