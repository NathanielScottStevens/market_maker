defmodule MarketMaker.Schema.Transaction do
  use MarketMaker.Schema
  import Ecto.Changeset
  alias MarketMaker.Schema.User
  alias MarketMaker.Schema.Visit

  @fields [:visit_id, :owner_id, :provider_id]

  schema "transactions" do
    belongs_to :visit, Visit, references: :id, type: Ecto.UUID
    belongs_to :owner, User, references: :id, type: Ecto.UUID
    belongs_to :provider, User, references: :id, type: Ecto.UUID

    timestamps()
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)

  def changeset(user, params) do
    user
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
