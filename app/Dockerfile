FROM ruby:2.4.2-alpine3.6
MAINTAINER Jay Chinthrajah <jay.chinthrajah@mmlafleur.com>

RUN apk --update add xvfb \
                     dbus \
                     ttf-freefont \
                     firefox-esr \
                     udev \
                     chromium \
                     ca-certificates \
                     gcc \
                     libc-dev \
                     make \
                     libffi-dev \
                     libxml2-dev \
                     bash \
                     python \
                     nodejs \
                     sqlite \
                     sqlite-dev \
                     vim

RUN rm -f /var/cache/apk/*
RUN gem install --no-rdoc --no-ri bundler watir nokogiri rails tzinfo-data

