# FROM jlesage/baseimage-gui:ubuntu-20.04-v4
FROM jlesage/baseimage-gui:debian-11-v4

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        wget \
        # for charles
        libxext6 libxrender1 libxtst6 libfreetype6 libfontconfig1 libxi6

RUN wget -O /tmp/charles.tar.gz 'https://www.charlesproxy.com/assets/release/4.6.7/charles-proxy-4.6.7_amd64.tar.gz' && \
    mkdir -p /opt && tar -xzf /tmp/charles.tar.gz -C /opt && rm /tmp/charles.tar.gz

# https://github.com/jlesage/docker-baseimage-gui/issues/26#issuecomment-752073835
RUN mkdir -p /home/app && \
    sed -i -E "s@^ +-jar @-Djavafx.cachedir=/home/app -Duser.home=/home/app -jar @" /opt/charles/bin/charles

COPY startapp.sh /startapp.sh

RUN set-cont-env APP_NAME "Charles"
