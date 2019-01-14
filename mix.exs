defmodule YearInProgress.MixProject do
  use Mix.Project

  def project do
    [
      app: :year_in_progress,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :progress_bar]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:progress_bar, "> 0.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp escript do
    [main_module: YearInProgress.CLI]
  end

  defp description do
    "Draws year in progress on your terminal."
  end

  defp package do
    [
      name: "year_in_progress",
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/murat/year-in-progress"}
    ]
  end
end
