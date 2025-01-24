FROM ruby:3.1-slim

WORKDIR /webmotors.buyer.test.api/
COPY . /webmotors.buyer.test.api/

RUN gem install bundler && bundle install