FROM alpine:3.2
MAINTAINER Azuki <support@azukiapp.com>

# install default packages
RUN packages=' \
    bash \
    socat \
    dnsmasq \
  ' \
  set -x \
  && apk --update add $packages \
  && rm -rf /var/cache/apk/*

# Expose ports.
EXPOSE 53/udp
EXPOSE 80
