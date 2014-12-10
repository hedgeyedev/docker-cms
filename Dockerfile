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

RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install nginx-extras passenger supervisor

# Configure nginx
RUN mkdir -p /var/log/supervisor
RUN rm /etc/nginx/sites-enabled/default

ADD config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD config/nginx.conf /etc/nginx/nginx.conf
ADD start_nginx_rails.sh /opt/start_nginx_rails.sh
ADD config/site.conf /etc/nginx/sites-enabled/site.conf
RUN chmod +x ./opt/start_nginx_rails.sh

VOLUME ["/var/log/nginx", "/var/log/supervisor"]

# Scott: this can happen later
# EXPOSE 80
# ENTRYPOINT ["./opt/start_nginx_rails.sh"]

RUN DEBIAN_FRONTEND=noninteractive apt-get update
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
# RUN mkdir /rails

# Build MySql version 5.1
RUN DEBIAN_FRONTEND=noninteractive apt-cache search ncurses
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install libncurses5-dev
ADD build_mysql51.sh /work/
RUN /work/build_mysql51.sh

# Build Ruby
WORKDIR /work
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install \
  autoconf \
  bison \
  curl \
  libssl-dev \
  libreadline6-dev \
  libyaml-dev \
  subversion \
  zlib1g \
  zlib1g-dev

RUN wget -q -O ruby-1.8.7-p370.tar.gz http://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p370.tar.gz
RUN tar xvf ruby-1.8.7-p370.tar.gz
RUN rm ruby-1.8.7-p370.tar.gz
WORKDIR ruby-1.8.7-p370
RUN ./configure
RUN make
RUN make install

