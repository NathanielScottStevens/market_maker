defmodule MarketMaker.Schema.Transaction do
  @moduledoc """
  Transactions record the execution of a visit. When a visit is completed, a transaction will be created,
  confirming completion of the visit. The owner is the creator of the visit and the provider the provider
  is the user who accepted the visit and provided the service.
  """
  use MarketMaker.Schema
  import Ecto.Changeset
  alias MarketMaker.Schema.User
  alias MarketMaker.Schema.Visit

  @type t :: %__MODULE__{
          visit: list(Visit),
          owner: list(User),
          provider: list(User)
        }
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
