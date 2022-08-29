defmodule MarketMaker.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table("users", primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :email, :string, null: false
      add :minutes, :integer, null: false
      add :lock_version, :integer, default: 1

      timestamps()
    end
  end
end
