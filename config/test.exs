use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_blog, PhoenixBlog.Endpoint,
  http: [port: 4001],
  server: true

config :phoenix_blog, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_blog, PhoenixBlog.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "phoenix_blog_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Let's see a screenshot if an integration test fails
config :wallaby, screenshot_on_failure: true
