FROM ruby:2.2

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY ./comment_app.rb \
     ./config.ru \
     ./docker_build.sh \
     ./helpers.rb \
     ./VERSION \
     ./

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
