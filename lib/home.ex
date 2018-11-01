defmodule Home do
  use Application
  require Logger

  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT")) || raise "expected the PORT environment variable to be set"

    children = [
      Plug.Cowboy.child_spec(scheme: :http, plug: Home.Router, options: [port: port])
    ]

    Logger.info("Started application")

    opts = [strategy: :one_for_one, name: Home.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
