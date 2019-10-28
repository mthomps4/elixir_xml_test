defmodule XmlTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :xml_test,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :xml_builder, :sweet_xml, :soap]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:xml_builder, "~> 2.1.1"},
      {:sweet_xml, "~> 0.6.6"},
      # {:soap, "~> 1.0.1"},
      {:soap, git: "https://github.com/elixir-soap/soap", branch: "fix-empty-complex-types"}
    ]
  end
end
