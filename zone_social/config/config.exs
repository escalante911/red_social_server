# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :zone_social, ZoneSocialWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "euftFjiPjXfjVtxVGTgVpwxmX1lg+3fjZhcf96kpQJqsUYY0h7DedYf4GI++AasW",
  render_errors: [view: ZoneSocialWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ZoneSocial.PubSub,
  live_view: [signing_salt: "TQUPF6C+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
