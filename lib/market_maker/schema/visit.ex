defmodule MarketMaker.Schema.Visit do
  use MarketMaker.Schema
  import Ecto.Changeset
  alias MarketMaker.Schema.User

  @fields [:user_id, :date, :minutes, :tasks]

  schema "visits" do
    field :date, :date
    field :minutes, :integer
    field :tasks, :string
    belongs_to :user, User, references: :id, type: Ecto.UUID

    timestamps()
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)

  def changeset(user, params) do
    user
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
