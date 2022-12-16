FROM ubuntu:22.04
ARG netDeps="iputils-ping net-tools iproute2 curl wget"
ARG otherDeps="apt-utils git psmisc vim lrzsz lsb-core sudo"
WORKDIR /root
EXPOSE 22
RUN set -x \
    # set repo mirror
    && sed -i -r 's#http://(archive|security).ubuntu.com#http://mirrors.tuna.tsinghua.edu.cn#g' /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y install ${otherDeps} \
    && apt-get -y install ${netDeps}
COPY ./script/init.sh /root/init.sh
RUN set -x \
    && chmod +x /root/init.sh \
    && /root/init.sh