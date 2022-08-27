defmodule MarketMaker.Visits do
  alias MarketMaker.Repo
  alias MarketMaker.Schema.Visit

  def create(params) do
    params
    |> Visit.changeset()
    |> Repo.insert()
  end

  def get(id) do
    Repo.get(Visit, id)
  end

  def get_all() do
    Repo.all(Visit)
  end
end
