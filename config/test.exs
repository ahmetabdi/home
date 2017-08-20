use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :home, HomeWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :home, Home.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "home_test",
  hostname: System.get_env("DB_HOST") || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :home, Home.Emails.Mailer,
  adapter: Bamboo.TestAdapter
