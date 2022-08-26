defmodule MarketMakerWeb.UserControllerTest do
  use MarketMakerWeb.ConnCase
  alias MarketMakerWeb.Router.Helpers, as: PathHelper

  describe "POST /users" do
    test "returns success response", %{conn: conn} do
      user = %{
        "first_name" => "nathaniel",
        "last_name" => "stevens",
        "email" => "my-email@example.com"
      }

      result =
        conn
        |> post(PathHelper.user_path(conn, :create), user)
        |> json_response(200)

      assert user["first_name"] == result["first_name"]
    end

    test "returns 400 response", %{conn: conn} do
      user = %{
        "first_name" => 1,
        "last_name" => "stevens",
        "email" => "my-email@example.com"
      }

      assert conn
             |> post(PathHelper.user_path(conn, :create), user)
             |> json_response(400)
    end
  end
end
