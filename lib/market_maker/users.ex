defmodule MarketMaker.Users do
  @moduledoc """
  Business logic and persistence operations for users
  """
  alias MarketMaker.Repo
  alias MarketMaker.Schema.User

  @spec create(map()) :: {:ok, User.t()} | {:error, Ecto.Changeset.t()}
  def create(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end

  @spec get(String.t()) :: User.t() | nil
  def get(id) do
    Repo.get(User, id)
  end

  @spec get_all() :: list(User.t())
  def get_all() do
    Repo.all(User)
  end
end
