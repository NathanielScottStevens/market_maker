defmodule MarketMakerWeb.UserControllerTest do
  use MarketMakerWeb.ConnCase
  alias MarketMakerWeb.Router.Helpers, as: PathHelper
  alias MarketMakerWeb.Schemas.User

  describe "POST /users" do
    test "returns success response", %{conn: conn} do
      user =
        User.schema()
        |> Norm.gen()
        |> Enum.take(1)
        |> IO.inspect(label: "test/market_maker_web/controllers/user_controller_test.exs:8")

      result =
        conn
        |> post(PathHelper.user_path(conn, :create), user)
        |> json_response(200)

      assert user["first_name"] == result["first_name"]
    end

    test "returns 400 when data is invalid", %{conn: conn} do
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
