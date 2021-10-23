#docker build -t ruby_study .
FROM ruby:2.7.4

RUN mkdir -p /lessons
WORKDIR /lessons
COPY . ./