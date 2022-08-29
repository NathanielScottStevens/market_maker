defmodule MarketMaker.Schema.User do
  @moduledoc false
  use MarketMaker.Schema
  import Ecto.Changeset
  alias MarketMaker.Schema.Visit
  alias MarketMaker.Schema.Transaction

  @type t :: %__MODULE__{
          first_name: String.t(),
          last_name: String.t(),
          email: String.t(),
          minutes: integer(),
          visits: list(Visit),
          transactions: list(Transaction)
        }
  @fields [:first_name, :last_name, :email, :minutes]

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :minutes, :integer
    field :lock_version, :integer, default: 1
    has_many :visits, Visit
    has_many :transactions, Transaction

    timestamps()
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)

  def changeset(user, params) do
    user
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> optimistic_lock(:lock_version)
  end
end
