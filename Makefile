DC = $(shell which docker-compose)
DOCKER = $(shell which docker)
MIX = $(DC) run --rm web mix
NPM = $(DC) run --rm web npm

build:
		$(DC) build web
		$(DC) run --rm web mix deps.get
.PHONY: build

setup:
	$(DC) run --rm web mix ecto.create
	$(DC) run --rm web mix ecto.migrate
	$(DC) run --rm web mix run priv/repo/seeds.exs
	$(DC) run --rm web npm --prefix assets install
.PHONY: setup

clean:
	$(DC) down --rmi local -v
.PHONY: clean
