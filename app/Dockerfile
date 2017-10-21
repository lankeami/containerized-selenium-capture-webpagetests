FROM alpine:3.5
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
                     ruby \
                     ruby-dev \
                     libffi-dev \
                     libxml2-dev \
                     bash \
                     python \
                     vim

RUN rm -f /var/cache/apk/*
RUN gem install --no-rdoc --no-ri watir nokogiri

