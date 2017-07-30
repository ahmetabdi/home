# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :home,
  ecto_repos: [Home.Repo]

# Configures the endpoint
config :home, HomeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9nRs7XKfz8+yZxe99mn6GYzyooGQUgjyYJb/zYbmFeVfGvZKn6sU4RylDQgqRoN8",
  render_errors: [view: HomeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Home.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
