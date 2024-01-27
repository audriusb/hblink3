# HBlink3 docker image with parrot and HBMonitor

## Description

Will run without any additional settings.

Default port for hotspot to use is 62030 (all hotspots include this in their firewall whitelist). Parrot uses 9999 Talk Group.
Default port for HBMonitor (dashboard) is 8081.

Tested on ubuntu linux and on RaspberryPi 3A+.

Processes are launched by supervisord

## Requirements

- `docker.io` installed on system
- `buildkit` with Docker desktop or `qemu` presend on machine if you want to build for multiple archs (optional)

## Build from source (optional)

- Multiple archs: `docker buildx build . -t tapkation/hblink:latest --platform "linux/amd64,linux/arm64,linux/arm/v7"`
- Single arch: `docker build . -t tapkation/hblink:latest`

## Run from docker hub

`docker run tapkation/hblink:latest`

## Config

Supports environment variables (with default values):

- MASTER_PORT=62030
- MASTER_PASSPHRASE=s3cr37w0rd
- PARROT_PORT=54100
- PARROT_PASSWORD=echopassword
- HBMON_PORT=8081
- HBMON_AUTH=False
- HBMON_USER=hblink
- HBMON_PASSWORD=hblink
