defmodule MarketMaker.Users do
  alias MarketMaker.Repo
  alias MarketMaker.Schema.User

  def create(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
