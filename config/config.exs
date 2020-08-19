# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gotcha,
  ecto_repos: [Gotcha.Repo]

# Configures the endpoint
config :gotcha, GotchaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4GTFZJfLPdYQ8ia8w76uNrjwlL/+p8f5xnaGTJOTWDf1HJ6Q9kC8xJRWxVspL+L3",
  render_errors: [view: GotchaWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Gotcha.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "w6qCCHIW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
