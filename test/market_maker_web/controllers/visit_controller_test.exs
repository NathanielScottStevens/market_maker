defmodule MarketMakerWeb.VisitControllerTest do
  use MarketMakerWeb.ConnCase
  alias MarketMakerWeb.Router.Helpers, as: PathHelper
  alias MarketMakerWeb.VisitHelper
  alias MarketMakerWeb.UserHelper

  describe "GET /visits" do
    test "returns success response", %{conn: conn} do
      user = UserHelper.create(conn)
      visit = VisitHelper.create(conn, user["id"])

      result =
        conn
        |> get(PathHelper.visit_path(conn, :show, visit["id"]))
        |> json_response(200)

      assert visit["minutes"] == result["minutes"]
    end
  end

  describe "POST /visits" do
    test "returns success response", %{conn: conn} do
      user = UserHelper.create(conn)
      visit = VisitHelper.data(user["id"])

      result =
        conn
        |> post(PathHelper.visit_path(conn, :create), visit)
        |> json_response(200)

      assert visit["minutes"] == result["minutes"]
    end

    test "returns 400 when data is invalid", %{conn: conn} do
      user = UserHelper.create(conn)
      visit = VisitHelper.data(user["id"], %{"date" => "not-a-date"})

      assert conn
             |> post(PathHelper.visit_path(conn, :create), visit)
             |> json_response(400)
    end
  end
end
