FROM ubuntu:16.04
MAINTAINER Jens Fischer <soth@gmx.net>

RUN apt-get update && \
    apt-get install -y software-properties-common python-software-properties && \
    add-apt-repository -y ppa:chris-lea/nginx-devel && \
    apt-get update && \
    apt-get install -y nginx-extras lua-posix && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
