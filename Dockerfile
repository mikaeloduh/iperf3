FROM alpine:3.24@sha256:3f4d6b32e26703c6082839234f43769d5046b3ac7c910033911d1e71d8cd630a

# Metadata
LABEL maintainer="mikaeloduh"
LABEL description="Minimal iperf3 image based on Alpine"

RUN apk add --no-cache iperf3

RUN adduser -D -u 1000 iperfuser
USER iperfuser

EXPOSE 5201/tcp 5201/udp

ENTRYPOINT ["iperf3"]
CMD ["-s"]
