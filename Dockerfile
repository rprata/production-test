FROM phusion/passenger-ruby21:latest

MAINTAINER Renan version: 0.1

ENV HOME /root

# RUN /pd_build/ruby2.1.sh
RUN rm -f /etc/service/nginx/down

# Basic

RUN sed -i 's/archive\.ubuntu\.com/us\.archive\.ubuntu\.com/' /etc/apt/sources.list && sudo rm -rf /var/lib/apt/lists/*
RUN apt-get -y update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get -y update && apt-get install -y mysql-client \
postgresql-client \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#############
# Application
#############
WORKDIR /home/app/
## Gem cache
ADD Gemfile /home/app/Gemfile
ADD Gemfile.lock /home/app/Gemfile.lock
USER app
RUN bundle install --path=/home/app/bundle
## assets cache
#ADD app/assets/ /home/app/app/assets/
#ADD config/ /home/app/config/
#ADD Rakefile /home/app/Rakefile
#ADD app/ /home/app/app/
#ADD vendor/ /home/app/vendor/
#RUN rake assets:precompile RAILS_ENV=production
USER root
ADD . /home/app
RUN chown -R app:app /home/app/
USER app
RUN chmod 755 .
RUN touch log/development.log && chmod 0666  log/development.log
RUN touch log/production.log && chmod 0666  log/production.log
RUN touch log/newrelic_agent.log && chmod 0666  log/newrelic_agent.log
USER root
#RUN rake assets:precompile RAILS_ENV=production

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# NGINX AND PASSENGER ENABLER
RUN rm /etc/nginx/sites-enabled/default
ADD docker/nginx/picasso.conf /etc/nginx/sites-enabled/picasso.conf
ADD docker/nginx/secret_key.conf /etc/nginx/main.d/secret_key.conf
ADD docker/nginx/gzip_max.conf /etc/nginx/conf.d/gzip_max.conf
ADD docker/content/rubber.yml /home/app/config/rubber/rubber.yml
ADD docker/content/database.yml config/database.yml

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]
