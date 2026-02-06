FROM alpine:3.23@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659

# Metadata
LABEL maintainer="mikaeloduh"
LABEL description="Minimal iperf3 image based on Alpine"

# renovate: datasource=repology depName=alpine_3_23/iperf3 versioning=loose
ARG IPERF3_VERSION=3.19.1-r1

RUN apk add --no-cache iperf3=${IPERF3_VERSION}

RUN adduser -D -u 1000 iperfuser
USER iperfuser

EXPOSE 5201/tcp 5201/udp

ENTRYPOINT ["iperf3"]
CMD ["-s"]
