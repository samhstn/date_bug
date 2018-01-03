# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :date_bug,
  ecto_repos: [DateBug.Repo]

# Configures the endpoint
config :date_bug, DateBugWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V3p/fULzCJgYgk0TKs3V86Us+CK+rE07LUdsXvernIy8ycngdLoqIDQiSZYwl9rD",
  render_errors: [view: DateBugWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DateBug.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
