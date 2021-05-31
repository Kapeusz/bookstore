# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bookstore,
  ecto_repos: [Bookstore.Repo]

# Configures the endpoint
config :bookstore, BookstoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NSDQtTSguG4Z2cxT+W6fF9StofkhKNJHaHmT58PEsQDfMM5iOXwMS7gnO9TRDJjT",
  render_errors: [view: BookstoreWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bookstore.PubSub,
  live_view: [signing_salt: "uIk2UMXS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Config Amazon S3 Storage
config :waffle,
  storage: Waffle.Storage.S3,
  bucket: "bookstoreelixir",
  virtual_host: true

config :ex_aws,
  access_key_id: "X.X.X.",
  secret_access_key: "X.X.X.",
  region: "eu-central-1",
  s3: [
    scheme: "https://",
    host: "s3.eu-central-1.amazonaws.com",
    region: "eu-central-1"
  ]

config :scrivener_html,
  routes_helper: Bookstore.Router.Helpers

config(:bookstore, :pow,
  user: Bookstore.Users.User,
  repo: Bookstore.Repo,
  web_module: BookstoreWeb,
  extensions: [PowEmailConfirmation, PowResetPassword, PowPersistentSession],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: BookstoreWeb.Pow.Mailer,
  messages_backend: BookstoreWeb.Pow.Messages
)

config :bookstore, Bookstore.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "X.X.X."

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
