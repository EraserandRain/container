FROM ubuntu:12.04
WORKDIR /root
EXPOSE 22

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ./12.04/sources.list /etc/apt/sources.list
RUN set -x \
    && apt-get -y update \
    && apt-get -y install apt-utils net-tools iproute2 iputils-ping openssh-server sudo lsb-core \
    && apt-get -y install vim supervisor 
RUN mkdir -p /var/run/sshd /var/log/supervisor

# ssh account
ARG NEW_USER='tester'
ARG USER_PASS='Abcd1234'
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo root:test | chpasswd \
    && useradd ${NEW_USER} -s /bin/bash -U -G sudo -m \
    && echo ${NEW_USER}:${USER_PASS} | chpasswd \
    && bash -c "echo '${NEW_USER} ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/${NEW_USER}"

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]