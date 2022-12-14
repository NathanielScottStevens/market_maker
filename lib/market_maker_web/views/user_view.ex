defmodule MarketMakerWeb.UserView do
  use MarketMakerWeb, :view

  def render("show.json", %{user: user}) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email
    }
  end

  def render("index.json", %{users: users}) do
    render_many(users, __MODULE__, "show.json")
  end
end
