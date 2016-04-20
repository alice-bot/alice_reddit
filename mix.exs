defmodule AliceReddit.Mixfile do
  use Mix.Project

  def project do
    [app: :alice_reddit,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:readit]]
  end

  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:websocket_client, github: "jeremyong/websocket_client"},
      {:alice, "~> 0.2"},
      {:readit, "~> 0.0"}
    ]
  end
end
