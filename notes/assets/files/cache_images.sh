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
# tools and languanges
podman pull sonatype/nexus3
podman pull node
podman pull python
podman pull tiangolo/uwsgi-nginx-flask
podman pull tiangolo/uvicorn-gunicorn-fastapi
podman pull tiangolo/uvicorn-gunicorn-starlette
podman pull tiangolo/meinheld-gunicorn-flask
podman pull django
podman pull docker
podman pull centos:7
podman pull centos
podman pull alpine

# databases
podman pull mongo
podman pull adminer
podman pull postgres:latest
podman pull postgres:11
podman pull mariadb

# workflow and graphql
podman pull prefecthq/server
podman pull prefecthq/ui
podman pull prefecthq/apollo
podman pull hasura/graphql-engine
podman pull dgraph/standalone:master
podman pull dgraph/dgraph

# Logging. I love logging
podman pull graylog/graylog:3.3
podman pull elasticsearch/elasticsearch-oss:7.9.3
podman pull logstash/logstash-oss:7.9.3
podman pull grafana/loki
podman pull grafana/promtail
podman pull grafana/grafana

# because sometimes I have to fake AWS
podman pull minio/minio

# For no work reason
podman pull linuxserver/musicbrainz

# For pipeline and data workdflow
podman pull apache/nifi-registry
podman pull apache/nifi

# If caching/mirroring is setup right, I should feel perfectly okay doing the following:
# podman system prune --all --force --volumes