defmodule MarketMakerWeb.UserController do
  use MarketMakerWeb, :controller

  alias MarketMaker.Users

  def index(conn, _params) do
    # Get all customers
    render(conn, "index.html")
  end

  def show(conn, _params) do
    render(conn, "show.json", %{
      id: Ecto.UUID,
      first_name: "nathaniel",
      last_name: "stevens",
      email: "ns@example.com"
    })
  end

  def create(conn, params) do
    {:ok, user} =
      Users.create(params)
      |> IO.inspect(label: "lib/market_maker_web/controllers/user_controller.ex:21")

    text(conn, user.id)
  end

  def update(conn, _params) do
    # update customer
    render(conn, "index.html")
  end
end
