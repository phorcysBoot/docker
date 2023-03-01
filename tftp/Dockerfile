# TODO: rootless

ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache bash
RUN apk add --no-cache tftp-hpa

VOLUME /tftpboot
ADD entrypoint.sh /

ENV VERBOSITY=3
ENV SECURE=true
ENV ROOT=/tftpboot

EXPOSE 69/udp
ENTRYPOINT [ "/entrypoint.sh" ]