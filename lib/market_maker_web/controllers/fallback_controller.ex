defmodule MarketMakerWeb.FallbackController do
  use MarketMakerWeb, :controller

  alias MarketMakerWeb.ErrorView

  def call(conn, {:error, :invalid_user_input}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render(:"400.json")
  end
end
