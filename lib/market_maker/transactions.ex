defmodule MarketMaker.Transactions do
  @moduledoc """
  Business logic and persistence operations for transactions
  """
  alias MarketMaker.Repo
  alias MarketMaker.Schema.Transaction

  @spec create(map()) :: {:ok, Transaction.t()} | {:error, Ecto.Changeset.t()}
  def create(params) do
    params
    |> Transaction.changeset()
    |> Repo.insert()
  end

  @spec get(String.t()) :: Transaction.t() | nil
  def get(id) do
    Repo.get(Transaction, id)
  end

  @spec get_all() :: list(Transaction.t())
  def get_all() do
    Repo.all(Transaction)
  end
end
