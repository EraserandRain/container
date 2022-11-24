#!/bin/bash
LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")
echo "[${LOGTIME}] startup run..." >> start.log
service ssh start >> start.log


# add user tester
new_user='tester'
pass_word='Abcd1234'
new_groups='tester'

id -u ${new_user} >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
    groupadd ${new_groups}
    useradd ${new_user} -s /bin/bash -g ${new_groups} -G sudo -d "/home/${new_user}" -m
    echo ${new_user}:${pass_word} | chpasswd
    bash -c "echo '${new_user} ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/${new_user}"
fi
