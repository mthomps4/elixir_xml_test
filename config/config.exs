# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :soap, :globals, version: "1.1"

if Mix.env() == :test do
  import_config "#{Mix.env()}.exs"
end
