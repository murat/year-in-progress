defmodule YearInProgress.MixProject do
  use Mix.Project

  def project do
    [
      app: :year_in_progress,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
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
      {:progress_bar, "> 0.0.0"}
    ]
  end

  defp escript do
    [main_module: YearInProgress.CLI]
  end
end
