FROM maven:3.3.9-jdk-8

MAINTAINER Zoltan Medve <debugmedve@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends curl jq && rm -rf /var/lib/apt/lists/*
