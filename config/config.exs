# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phx_tic_tac_toe,
  ecto_repos: [PhxTicTacToe.Repo]

# Configures the endpoint
config :phx_tic_tac_toe, PhxTicTacToeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yJ61vOzWg6Kxj+qRg9HpzESIywcQi+ZN1pFbY+9y0kbq13JV2vEp7bp/vPkQjTv6",
  render_errors: [view: PhxTicTacToeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxTicTacToe.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
