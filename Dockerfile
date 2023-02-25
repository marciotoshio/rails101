# syntax=docker/dockerfile:1.4

# Builder image
FROM ruby:3.2.1-alpine3.17

RUN apk add --no-cache\
 build-base\
 postgresql-dev\
 libxslt-dev\
 libxml2-dev\
 nodejs\
 tzdata

ENV APP_HOME /usr/src/core

WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME

RUN bundle config force_ruby_platform true\
 && gem update --system\
 && gem install bundler\
 && bundle install

# Clean up cache
RUN rm -rf /var/cache/apk/*
RUN rm -rf $GEM_HOME/cache

COPY . $APP_HOME

EXPOSE 3000
ENTRYPOINT ["bundle", "exec", "rails"]
