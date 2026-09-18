FROM alpine:3.24@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6

# Metadata
LABEL maintainer="mikaeloduh"
LABEL description="Minimal iperf3 image based on Alpine"

RUN apk add --no-cache iperf3

RUN adduser -D -u 1000 iperfuser
USER iperfuser

EXPOSE 5201/tcp 5201/udp

ENTRYPOINT ["iperf3"]
CMD ["-s"]
