defmodule MarketMakerWeb.TransactionControllerTest do
  use MarketMakerWeb.ConnCase
  alias MarketMakerWeb.Router.Helpers, as: PathHelper
  alias MarketMakerWeb.TransactionHelper
  alias MarketMakerWeb.UserHelper
  alias MarketMakerWeb.VisitHelper

  describe "GET /transactions" do
    test "returns success response", %{conn: conn} do
      owner = UserHelper.create(conn)
      provider = UserHelper.create(conn)
      visit = VisitHelper.create(conn, owner["id"])
      transaction = TransactionHelper.create(conn, owner["id"], provider["id"], visit["id"])

      result =
        conn
        |> get(PathHelper.transaction_path(conn, :show, transaction["id"]))
        |> json_response(200)

      assert transaction["owner_id"] == result["owner_id"]
    end
  end

  describe "POST /transactions" do
    test "returns success response", %{conn: conn} do
      owner = UserHelper.create(conn)
      provider = UserHelper.create(conn)
      visit = VisitHelper.create(conn, owner["id"])
      transaction = TransactionHelper.data(owner["id"], provider["id"], visit["id"])

      result =
        conn
        |> post(PathHelper.transaction_path(conn, :create), transaction)
        |> json_response(200)

      assert transaction["owner_id"] == result["owner_id"]
    end

    test "returns 400 when data is invalid", %{conn: conn} do
      owner = UserHelper.create(conn)
      provider = UserHelper.create(conn)
      visit = VisitHelper.create(conn, owner["id"])
      transaction = TransactionHelper.data(owner["id"], provider["id"], "invalid_id")

      assert conn
             |> post(PathHelper.transaction_path(conn, :create), transaction)
             |> json_response(400)
    end
  end
end
