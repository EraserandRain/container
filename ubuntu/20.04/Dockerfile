FROM ubuntu:20.04
WORKDIR /root
EXPOSE 22

RUN set -x \
    && apt-get -y update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install apt-utils net-tools iproute2 iputils-ping openssh-server sudo lsb-core \
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
