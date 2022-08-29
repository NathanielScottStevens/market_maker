defmodule MarketMaker.TransactionsTest do
  use MarketMaker.DataCase, async: true

  alias MarketMaker.Transactions
  alias MarketMaker.Users
  alias MarketMakerWeb.UserHelper
  alias MarketMakerWeb.VisitHelper

  describe "create/1" do
    test "creates a transaction" do
      owner = UserHelper.create_from_context()
      provider = UserHelper.create_from_context()
      visit = VisitHelper.create_from_context(owner.id)

      {:ok, transaction} =
        Transactions.create(%{
          "owner_id" => owner.id,
          "provider_id" => provider.id,
          "visit_id" => visit.id
        })

      assert transaction.owner_id == owner.id
    end

    test "transfers minutes from owner to provider with fee" do
      owner = UserHelper.create_from_context(%{"minutes" => 90})
      provider = UserHelper.create_from_context(%{"minutes" => 120})
      visit = VisitHelper.create_from_context(owner.id, %{"minutes" => 60})

      {:ok, _transaction} =
        Transactions.create(%{
          "owner_id" => owner.id,
          "provider_id" => provider.id,
          "visit_id" => visit.id
        })

      {:ok, new_owner} = Users.get(owner.id)
      {:ok, new_provider} = Users.get(provider.id)

      assert new_owner.minutes == owner.minutes - visit.minutes
      fee = visit.minutes * 0.15
      assert new_provider.minutes == provider.minutes + (visit.minutes - fee)
    end

    test "does not transfer minutes if owner does not have enough" do
      owner = UserHelper.create_from_context(%{"minutes" => 10})
      provider = UserHelper.create_from_context(%{"minutes" => 30})
      visit = VisitHelper.create_from_context(owner.id, %{"minutes" => 30})

      result =
        Transactions.create(%{
          "owner_id" => owner.id,
          "provider_id" => provider.id,
          "visit_id" => visit.id
        })

      {:ok, new_owner} = Users.get(owner.id)
      {:ok, new_provider} = Users.get(provider.id)

      assert {:error, :not_enough_minutes} == result
      assert new_owner.minutes == owner.minutes
      assert new_provider.minutes == provider.minutes
    end
  end
end
