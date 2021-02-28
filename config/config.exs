# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elxpay,
  ecto_repos: [Elxpay.Repo]

# Configures the endpoint
config :elxpay, ElxpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EIMgbjKAfrs8v7Uc1ZmNuup+kqrpc5foc5CLY/HeiXw+0/b7foqsWqioOpKMnuRp",
  render_errors: [view: ElxpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Elxpay.PubSub,
  live_view: [signing_salt: "NtJDcJBv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
