FROM nurelmdevelopment/ruby-base-image
MAINTAINER Joaquin Perez, joaquin@nurelm.com

RUN apt-get update && apt-get install -y locales

## set the locale so gems built for utf8
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8

RUN gem install bundler --no-rdoc --no-ri

WORKDIR /app
ADD ./ /app
RUN bundle install --jobs 20
