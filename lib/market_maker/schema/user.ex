defmodule MarketMaker.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @fields [:first_name, :last_name, :email]

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string

    timestamps()
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)

  def changeset(user, params) do
    user
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
