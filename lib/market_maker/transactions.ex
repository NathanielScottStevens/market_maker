defmodule MarketMaker.Transactions do
  @moduledoc """
  Business logic and persistence operations for transactions
  """
  alias MarketMaker.Repo
  alias MarketMaker.Schema.Transaction
  alias MarketMaker.Schema.User
  alias MarketMaker.Users
  alias MarketMaker.Visits
  alias Ecto.Multi

  @spec create(map()) :: {:ok, Transaction.t()} | {:error, Ecto.Changeset.t()}
  def create(params) do
    with {:ok, owner} <- Users.get(params["owner_id"]),
         {:ok, provider} <- Users.get(params["provider_id"]),
         {:ok, visit} <- Visits.get(params["visit_id"]),
         :ok <- Users.has_enough_minutes(owner, visit.minutes),
         {:ok, %{transaction: transaction}} <- process_transaction(owner, provider, visit, params) do
      {:ok, transaction}
    end
  end

  @spec get(String.t()) :: Transaction.t() | nil
  def get(id) do
    Repo.get(Transaction, id)
  end

  @spec get_all() :: list(Transaction.t())
  def get_all() do
    Repo.all(Transaction)
  end

  defp process_transaction(owner, provider, visit, params) do
    fee = Float.floor(visit.minutes * 0.15) |> trunc()

    Multi.new()
    |> Multi.update(:owner, User.changeset(owner, %{minutes: owner.minutes - visit.minutes}))
    |> Multi.update(
      :provider,
      User.changeset(provider, %{minutes: provider.minutes + (visit.minutes - fee)})
    )
    |> Multi.insert(:transaction, Transaction.changeset(params))
    |> Repo.transaction()
  end
end
