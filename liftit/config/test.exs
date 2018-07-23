use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :liftit, LiftitWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :liftit, Liftit.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "p0stgr3spass",
  database: "liftit_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
