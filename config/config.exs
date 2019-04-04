# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello,
  ecto_repos: [Hello.Repo]

# Configures the endpoint
config :hello, HelloWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f37qvcgfAO0KY/t9mRYqMqsoATcyseiZTGh3rBgnH1BKz9/YI3kd4cejTFKss/ac",
  render_errors: [view: HelloWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hello.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "88/VenvKDip0oXUkfCefX6FhrfWsYZ4vUsVrLAgrIcaBiBKODiVSOE0p0mQQvfxP"
  ],
  live_reload: [
    patterns: [
      ~r{lib/hellp_web/live/.*(ex)$}
    ]
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Enable writing LiveView templates with the .leex extension
config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
