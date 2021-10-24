import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :heat_tags, HeatTags.Repo,
  username: "postgres",
  password: "postgres",
  database: "heat_tags_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  port: 4000,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :heat_tags, HeatTagsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "lhucXvTTh7SmVfNF60uV0y3aAPs7nZJ955/TxkPKYZP6VXQNNsiIrdlQfwDb798o",
  server: false

# In test we don't send emails.
config :heat_tags, HeatTags.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
