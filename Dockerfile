FROM elixir:latest

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN mix local.hex --force \
      && mix local.rebar --force

ADD . /app

EXPOSE 4000
