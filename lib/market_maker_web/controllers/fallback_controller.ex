defmodule MarketMakerWeb.FallbackController do
  use MarketMakerWeb, :controller

  alias MarketMakerWeb.ErrorView

  def call(conn, {:error, %Ecto.Changeset{}}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render(:"400.json")
  end
end
