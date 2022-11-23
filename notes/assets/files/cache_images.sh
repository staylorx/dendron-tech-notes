#!/usr/bin/env sh
#
# I run this from time to time to cache the latest and greatest into our on-prem mirror.
# With hub.docker.com limiting downloads, it makes sense to cache some of this locally.
#
# This assumes podman (or Docker, sure) have the local Nexus3 as mirror. Otherwise, this 
# doesn't really help at all.
#
# It has the added benefit of greatly increasing development velocity.
#

# MacOS
# https://hub.docker.com/r/sickcodes/docker-osx
docker pull sickcodes/docker-osx:latest
docker pull sickcodes/docker-osx:auto
docker pull sickcodes/docker-osx:high-sierra
docker pull sickcodes/docker-osx:mojave
docker pull sickcodes/docker-osx:big-sur
docker pull sickcodes/docker-osx:monterey

# I&C OT
docker pull inductiveautomation/ignition
 
# development tools
docker pull sonatype/nexus3
docker pull node
docker pull python
docker pull tiangolo/uwsgi-nginx-flask
docker pull tiangolo/uvicorn-gunicorn-fastapi
docker pull tiangolo/uvicorn-gunicorn-starlette
docker pull tiangolo/meinheld-gunicorn-flask
docker pull django
docker pull docker
docker pull debian
docker pull centos:8
docker pull centos
docker pull alpine

# databases
docker pull mongo
docker pull adminer
docker pull postgres:latest
docker pull mariadb

# workflow and graphql
docker pull prefecthq/server
docker pull prefecthq/ui
docker pull prefecthq/apollo
docker pull hasura/graphql-engine
docker pull dgraph/standalone:master
docker pull dgraph/dgraph

# Logging. I love logging
docker pull graylog/graylog
docker pull elasticsearch/elasticsearch-oss:8.4.1
docker pull logstash/logstash-oss:8.4.1
docker pull grafana/loki
docker pull grafana/promtail
docker pull grafana/grafana

# because sometimes I have to fake AWS
docker pull minio/minio

# For no work reason
docker pull linuxserver/musicbrainz

# For pipeline and data workdflow
docker pull apache/nifi-registry
docker pull apache/nifi

# blockchain, smart contracts, and DAO
docker pull ethereum/solc:stable

# If caching/mirroring is setup right, I should feel perfectly okay doing the following:
# docker system prune --all --force --volumes
