defmodule AliceReddit.Mixfile do
  use Mix.Project

  def project do
    [app: :alice_reddit,
     version: "0.0.4",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Alice does Reddit",
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:readit]]
  end

  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:alice, "~> 0.2"},
      {:readit, ">= 0.0.4"}
    ]
  end

  defp package do
    [files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Adam Zaninovich"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/adamzaninovich/alice_reddit",
              "Docs"   => "https://github.com/adamzaninovich/alice_reddit"}]
  end
end
