defmodule MarketMaker.Transactions do
  alias MarketMaker.Repo
  alias MarketMaker.Schema.Transaction

  def create(params) do
    params
    |> Transaction.changeset()
    |> Repo.insert()
  end

  def get(id) do
    Repo.get(Transaction, id)
  end

  def get_all() do
    Repo.all(Transaction)
  end
end
