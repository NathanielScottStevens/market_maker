defmodule MarketMaker.Visits do
  @moduledoc """
  Business logic and persistence operations for visits
  """
  alias MarketMaker.Repo
  alias MarketMaker.Schema.Visit

  @spec create(map()) :: {:ok, Visit.t()} | {:error, Ecto.Changeset.t()}
  def create(params) do
    params
    |> Visit.changeset()
    |> Repo.insert()
  end

  @spec get(String.t()) :: Visit.t() | nil
  def get(id) do
    Repo.get(Visit, id)
  end

  @spec get_all() :: list(Visit.t())
  def get_all() do
    Repo.all(Visit)
  end
end
