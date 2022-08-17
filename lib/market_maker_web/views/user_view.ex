defmodule MarketMakerWeb.UserView do
  use MarketMakerWeb, :view

  def render("show.json", user) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email
    }
  end
end
