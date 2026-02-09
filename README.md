# [iperf3](https://github.com/mikaeloduh/iperf3)

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/mikaeloduh/iperf3/cicd.yml?branch=master&label=Build&logo=github)](https://github.com/mikaeloduh/iperf3/actions)
[![Trivy Scan](https://img.shields.io/github/actions/workflow/status/mikaeloduh/iperf3/cicd.yml?branch=master&label=Trivy%20Scan&logo=trivy)](https://github.com/mikaeloduh/iperf3/actions/workflows/cicd.yml)
[![Docker Image Version](https://img.shields.io/docker/v/mikaeloduh/iperf3?sort=date&logo=docker)](https://hub.docker.com/r/mikaeloduh/iperf3/tags)
[![Signed with Sigstore](https://img.shields.io/badge/sigstore-signed-purple?logo=sigstore)](https://sigstore.dev)
[![SLSA 3](https://slsa.dev/images/gh-badge-level3.svg)](https://slsa.dev)

Minimal iperf3 image based on Alpine

## Supported Architectures

* linux/amd64
* linux/arm64
* linux/arm/v7

## Usage

Run as Server (Default)

#### Docker Run

```bash
docker run -d --name iperf3 --restart unless-stopped -p 5201:5201/tcp -p 5201:5201/udp mikaeloduh/iperf3
```

#### Docker Compose

```yaml
services:
  iperf3:
    image: mikaeloduh/iperf3:latest
    container_name: iperf3
    restart: unless-stopped
    ports:
      - "5201:5201/udp"
      - "5201:5201/tcp"
```
