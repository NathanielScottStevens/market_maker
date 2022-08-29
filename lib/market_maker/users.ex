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

  @spec get(String.t()) :: {:ok, User.t()} | {:error, :user_not_found}
  def get(id) do
    case Repo.get(User, id) do
      nil -> {:error, :user_not_found}
      user -> {:ok, user}
    end
  end

  @spec get_all() :: list(User.t())
  def get_all() do
    Repo.all(User)
  end

  @spec has_enough_minutes(User.t(), integer()) :: :ok | {:error, :not_enough_minutes}
  def has_enough_minutes(%User{minutes: total_minutes}, minutes) when total_minutes >= minutes,
    do: :ok

  def has_enough_minutes(_user, _minutes),
    do: {:error, :not_enough_minutes}
end
