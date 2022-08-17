defmodule MarketMakerWeb.PageController do
  use MarketMakerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
