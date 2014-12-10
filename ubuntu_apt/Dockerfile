# DOCKER_VERSION 1.3.1
# VERSION 0.0.1

FROM ubuntu:12.04
MAINTAINER Scott Smith <oldfartdeveloper@gmail.com>

# Setup Apt
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install apt-transport-https ca-certificates
RUN echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger precise main" >> /etc/apt/sources.list
RUN apt-get update
