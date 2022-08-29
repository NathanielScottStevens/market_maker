defmodule MarketMakerWeb.UserController do
  use MarketMakerWeb, :controller

  alias MarketMaker.Users
  alias MarketMakerWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    users = Users.get_all()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, user} <- Users.get(id) do
      render(conn, "show.json", user: user)
    end
  end

  def create(conn, params) do
    with {:ok, user} <- Users.create(params) do
      render(conn, "show.json", user: user)
    end
  end
end
