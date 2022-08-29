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

  @spec get(String.t()) :: {:ok, Visit.t()} | {:error, :visit_not_found}
  def get(id) do
    case Repo.get(Visit, id) do
      nil -> {:error, :visit_not_found}
      user -> {:ok, user}
    end
  end

  @spec get_all() :: list(Visit.t())
  def get_all() do
    Repo.all(Visit)
  end
end
