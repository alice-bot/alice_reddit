defmodule AliceReddit.Mixfile do
  use Mix.Project

  def project do
    [app: :alice_reddit,
     version: "0.1.0",
     elixir: "~> 1.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Alice does Reddit",
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:readit]]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:alice, "~> 0.3"},
      {:readit, "~> 0.1.0"}
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
