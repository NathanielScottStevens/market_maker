defmodule MarketMakerWeb.UserControllerTest do
  use MarketMakerWeb.ConnCase
  alias MarketMakerWeb.Router.Helpers, as: PathHelper
  alias MarketMakerWeb.UserHelper

  describe "GET /users" do
    test "returns success response", %{conn: conn} do
      user = UserHelper.create(conn)

      result =
        conn
        |> get(PathHelper.user_path(conn, :show, user["id"]))
        |> json_response(200)

      assert user["first_name"] == result["first_name"]
    end
  end

  describe "POST /users" do
    test "returns success response", %{conn: conn} do
      user = UserHelper.data()

      result =
        conn
        |> post(PathHelper.user_path(conn, :create), user)
        |> json_response(200)

      assert user["first_name"] == result["first_name"]
    end

    test "returns 400 when data is invalid", %{conn: conn} do
      user = UserHelper.data(%{"first_name" => 1})

      assert conn
             |> post(PathHelper.user_path(conn, :create), user)
             |> json_response(400)
    end
  end
end
