ARG ALPINE_VERSION
ARG KEA_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache bash curl libcap

RUN curl -1sLf "https://dl.cloudsmith.io/public/isc/kea-2-0/setup.alpine.sh" | bash
RUN apk add --no-cache isc-kea-dhcp4 isc-kea-hook-stat-cmds isc-kea-hook-mysql-cb isc-kea-hook-lease-cmds isc-kea-hook-run-script isc-kea-hook-ha isc-kea-hook-flex-option

RUN chown -R kea:kea /etc/kea /var/lib/kea /var/run/kea
RUN setcap "cap_net_bind_service,cap_net_raw=+ep" /usr/sbin/kea-dhcp4

USER kea:kea
ENTRYPOINT ["/usr/sbin/kea-dhcp4", "-c", "/etc/kea/kea-dhcp4.conf"]