defmodule MarketMaker.Repo do
  use Ecto.Repo,
    otp_app: :market_maker,
    adapter: Ecto.Adapters.Postgres
end
