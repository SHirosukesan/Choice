# Dockerfile
FROM ruby:2.5.7
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn
WORKDIR /<#file_name>
COPY Gemfile Gemfile.lock /<#file_name>/
RUN bundle install
