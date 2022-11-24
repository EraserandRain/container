FROM ubuntu:18.04
WORKDIR /root
RUN set -x \
    && apt-get -y update \
    && apt-get -y install apt-utils net-tools iproute2 iputils-ping openssh-server sudo \
    && apt-get -y install vim \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo root:test | chpasswd
RUN service ssh start
EXPOSE 22
COPY ./start.sh /root/start.sh
RUN chmod +x /root/start.sh \
    && sed -i '$a\[[ -f /root/start.sh ]] && /root/start.sh ' /root/.bashrc
