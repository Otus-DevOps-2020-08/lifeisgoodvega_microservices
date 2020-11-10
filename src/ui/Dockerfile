FROM alpine:3.12

RUN apk --no-cache --update add -t packages ruby-full ruby-dev build-base && \
    gem install bundler:1.17.2

RUN mkdir /app
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY ./views ./views
COPY ./config.ru \
     ./docker_build.sh \
     ./helpers.rb \
     ./middleware.rb \
     ./ui_app.rb \
     ./VERSION \
     ./

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
