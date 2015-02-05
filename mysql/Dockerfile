# DOCKER_VERSION 1.3.1
# VERSION 0.0.1

FROM hedgeyedev/apache:0.0.1
MAINTAINER Scott Smith <oldfartdeveloper@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install \
  build-essential \
  git-core \
  imagemagick \
  libcurl3 \
  libcurl4-gnutls-dev \
  libmagickwand-dev \
  libsqlite3-dev \
  libxml2 \
  libxslt1-dev \
  memcached \
  wget

# Build MySql version 5.1
RUN DEBIAN_FRONTEND=noninteractive apt-cache search ncurses
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install libncurses5-dev
ADD build_mysql51.sh /work/
RUN /work/build_mysql51.sh
