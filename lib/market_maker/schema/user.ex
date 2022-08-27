defmodule MarketMaker.Schema.User do
  use MarketMaker.Schema
  import Ecto.Changeset
  alias MarketMaker.Schema.Visit

  @fields [:first_name, :last_name, :email]

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    has_many :visits, Visit

    timestamps()
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)

  def changeset(user, params) do
    user
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
