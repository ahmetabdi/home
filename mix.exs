defmodule Home.MixProject do
  use Mix.Project

  def project do
    [
      app: :home,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :bamboo],
      mod: {Home, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 2.5"},
      {:plug, "~> 1.7"},
      {:plug_cowboy, "~> 2.0"},
      {:bamboo, "~> 1.1"}
    ]
  end
end
