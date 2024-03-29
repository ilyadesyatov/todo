# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :todos,
  ecto_repos: [Todos.Repo]

# Configures the endpoint
config :todos, Todos.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CewFc3Kd7oCRaFB69LCdJujEjh6AW4mRrtnyWZh9tqNbCMOf6YIUQnBHqIkHnQE/",
  render_errors: [view: Todos.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Todos.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
