defmodule MarketMakerWeb.UserController do
  use MarketMakerWeb, :controller

  alias MarketMaker.Users
  alias MarketMakerWeb.Schemas.User, as: Schema
  alias MarketMakerWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    users = Users.get_all()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Users.get(id)
    render(conn, "show.json", user: user)
  end

  def create(conn, params) do
    with {:ok, validated_user} <- Schema.create(params),
         {:ok, user} <- Users.create(validated_user) do
      render(conn, "show.json", user: user)
    end
  end
end
