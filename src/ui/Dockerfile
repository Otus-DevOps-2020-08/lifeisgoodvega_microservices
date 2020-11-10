FROM ruby:2.2
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*

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
