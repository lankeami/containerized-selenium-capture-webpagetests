FROM selenium/node-chrome:3.6.0-copper

USER seluser

#====================================
# Scripts to run Selenium Standalone
#====================================
COPY entry_point.sh /opt/bin/entry_point.sh
#RUN chmod 777 /opt/bin/entry_point.sh

USER root

RUN echo "/opt/bin/entry_point.sh" >> /etc/init.d/superscript 
RUN apt-get update && apt-get install -y \ 
                libc-dev \
                bash \
                python \
                sqlite \
                ruby \
                ruby-dev \
                vim

RUN sudo apt-get install -y ruby`ruby -e 'puts RUBY_VERSION[/\d+\.\d+/]'`-dev
RUN sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
RUN sudo apt-get install -y libsqlite3-0 libsqlite3-dev
RUN sudo apt-get install -y nodejs

RUN gem install --no-rdoc --no-ri bundler rails watir nokogiri tzinfo-data

WORKDIR /var/speedy/app/speedy
EXPOSE 4444
