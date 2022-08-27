defmodule MarketMaker.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table("transactions", primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :visit_id, references(:visits, type: :uuid), null: false
      add :owner_id, references(:users, type: :uuid), null: false
      add :provider_id, references(:users, type: :uuid), null: false

      timestamps()
    end
  end
end
