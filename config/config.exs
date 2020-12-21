# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lager,
  ecto_repos: [Lager.Repo]

# Configures the endpoint
config :lager, LagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B91YlmmpkgLntCNO/rnfHjej5OFJCFg3R5emv06/+AFasS4TNza6hhnFRnipxjfl",
  render_errors: [view: LagerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Lager.PubSub,
  live_view: [signing_salt: "o/G2OVwc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
