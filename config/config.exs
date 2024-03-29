# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :pokex,
  ecto_repos: [Pokex.Repo]

# Configures the endpoint
config :pokex, PokexWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PokexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Pokex.PubSub,
  live_view: [signing_salt: "InNjty3O"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :pokex, Pokex.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :pokex, PokexWeb.Auth.Guardian,
  issuer: "pokex",
  secret_key: "hA1bEuXm7xUW00+0dt1gUYGKx+FdQEaeBfrLn7foshK/6ItuhVl2+Pf83KHb8COF"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

config :pokex, PokexWeb.Auth.Pipeline,
  module: PokexWeb.Auth.Guardian,
  error_handler: PokexWeb.Auth.ErrorHandler
