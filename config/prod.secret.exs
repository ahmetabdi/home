use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :home, HomeWeb.Endpoint,
  secret_key_base: "/+3RFznklFkj+ZlE5J3F75edx7UVf+CqClvuoBLEZwrVkxCsd4Z1P7061/j4cA0P"

# Configure your database
config :home, Home.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "home_dev",
  hostname: System.get_env("DB_HOST") || "localhost",
  pool_size: 15
