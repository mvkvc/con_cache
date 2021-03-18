Code.ensure_loaded?(Hex) and Hex.start()

defmodule ConCache.Mixfile do
  use Mix.Project

  @source_url "https://github.com/sasa1977/con_cache"
  @version "0.14.0"

  def project do
    [
      app: :con_cache,
      version: @version,
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs()
    ]
  end

  def application do
    [
      applications: [:logger],
      mod: {ConCache.Application, []}
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      description: """
        ETS based key-value storage with support for row-level isolated writes,
        TTL auto-purge, and modification callbacks.
      """,
      maintainers: ["Saša Jurić"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "#{@source_url}/blob/#{@version}/CHANGELOG.md#v#{
            String.replace(@version, ".", "")
          }",
        "GitHub" => @source_url
      }
    ]
  end

  defp docs do
    [
      extras: ["CHANGELOG.md", "README.md"],
      main: "readme",
      source_url: @source_url,
      source_ref: @version,
      formatters: ["html"]
    ]
  end
end
