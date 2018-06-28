# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sampler,
  ecto_repos: [Sampler.Repo]

# Configures the endpoint
config :sampler, SamplerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JplhFBrgPWFyg2P0kBuITVwY8LO6TzKs6nP5IuGGbNYbW3Th8q7QmLGFoVQj9nPq",
  render_errors: [view: SamplerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sampler.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
