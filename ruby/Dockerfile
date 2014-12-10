# DOCKER_VERSION 1.3.1
# VERSION 0.0.1

FROM hedgeyedev/mysql:0.0.1
MAINTAINER Scott Smith <oldfartdeveloper@gmail.com>

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

# Install RubyGems
WORKDIR /work
RUN wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.22.tgz
RUN tar -xvzf rubygems-1.8.22.tgz
WORKDIR rubygems-1.8.22
RUN ruby setup.rb
RUN gem update --system 1.7.2

# Install bundler
RUN gem install bundler
