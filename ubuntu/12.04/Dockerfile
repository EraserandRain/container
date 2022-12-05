FROM ubuntu:12.04
WORKDIR /root
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ./12.04/sources.list /etc/apt/sources.list
RUN set -x \
    && apt-get -y update \
    && apt-get -y install apt-utils net-tools iproute2 iputils-ping openssh-server sudo lsb-core \
    && apt-get -y install vim \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo root:test | chpasswd
RUN /etc/init.d/ssh start
EXPOSE 22
COPY ./script/start.sh /root/start.sh
RUN chmod +x /root/start.sh \
    && sed -i '$a\[[ -f /root/start.sh ]] && /root/start.sh ' /root/.bashrc
