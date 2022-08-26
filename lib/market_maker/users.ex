defmodule MarketMaker.Users do
  alias MarketMaker.Repo
  alias MarketMaker.Schema.User

  def create(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end

  def get(id) do
    Repo.get(User, id)
  end

  def get_all() do
    Repo.all(User)
  end
end
