# https://hub.docker.com/_/elixir/
FROM elixir:1.5.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libpq-dev \
    inotify-tools \
    && rm -rf /var/lib/apt/lists/*

# Install NodeJS 6.x and the NPM
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y -q nodejs \
      && rm -rf /var/lib/apt/lists/*

# Install phantomjs
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
      && tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 \
      && mv phantomjs-2.1.1-linux-x86_64/bin/* /usr/local/bin/ \
      && rm -rf phantomjs-2.1.1-linux-x86_64 \
      && rm -r phantomjs-2.1.1-linux-x86_64.tar.bz2

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN mix local.hex --force \
      && mix local.rebar --force

ADD . /app

EXPOSE 4000

# Create and set home directory
# WORKDIR /app

# # Configure required environment
# ENV MIX_ENV prod

# # Install hex (Elixir package manager)
# RUN mix local.hex --force

# # Install rebar (Erlang build tool)
# RUN mix local.rebar --force

# # Copy all dependencies files
# COPY mix.* ./

# # Install all production dependencies
# RUN mix deps.get --only prod

# # Compile all dependencies
# RUN mix deps.compile

# # Copy all application files
# COPY . .

# # Compile the entire project
# RUN mix compile

# # Run the application itself
# CMD ./scripts/docker.sh
