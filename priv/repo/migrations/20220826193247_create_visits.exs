defmodule MarketMaker.Repo.Migrations.CreateVisits do
  use Ecto.Migration

  def change do
    create table("visits", primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :date, :date, null: false
      add :minutes, :integer, null: false
      add :tasks, :string, null: false
      add :user_id, :uuid, null: false

      timestamps()
    end
  end
end
