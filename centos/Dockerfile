FROM centos:7
WORKDIR /root
EXPOSE 22

RUN yum -y install git curl sudo vim epel-release openssh-server passwd
RUN yum -y install supervisor
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

# ssh account
ARG NEW_USER='tester'
ARG USER_PASS='Abcd1234'
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo root:test | chpasswd \
    && useradd ${NEW_USER} -s /bin/bash -U -m \
    && echo ${NEW_USER}:${USER_PASS} | chpasswd \
    && bash -c "echo '${NEW_USER} ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/${NEW_USER}"

# supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD [ "/usr/bin/supervisord","-c", "/etc/supervisor/conf.d/supervisord.conf" ]   
