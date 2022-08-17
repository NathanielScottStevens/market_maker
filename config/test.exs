import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :market_maker, MarketMaker.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "market_maker_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :market_maker, MarketMakerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "FQE0J0YGBGgmnvN/9htCbf4OyoWjx2S0tHFQGrfor8m4d+r3aqe9KdcxERpfHALS",
  server: false

# In test we don't send emails.
config :market_maker, MarketMaker.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
