FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /root
RUN set -x \
    && apt-get -y update \
    && apt-get -y install apt-utils tcl net-tools iproute2 iputils-ping openssh-server sudo lsb-core \
    && apt-get -y install vim \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo root:test | chpasswd
RUN service ssh start
EXPOSE 22
COPY ./start.sh /root/start.sh
RUN chmod +x /root/start.sh \
    && sed -i '$a\[[ -f /root/start.sh ]] && /root/start.sh ' /root/.bashrc
