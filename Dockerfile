FROM alpine:3.24@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf

ARG IPERF3_VERSION=3.20-r0

# Metadata
LABEL maintainer="mikaeloduh"
LABEL description="Minimal iperf3 image based on Alpine"

RUN apk add --no-cache "iperf3=${IPERF3_VERSION}"

RUN adduser -D -u 1000 iperfuser
USER iperfuser

EXPOSE 5201/tcp 5201/udp

ENTRYPOINT ["iperf3"]
CMD ["-s"]
