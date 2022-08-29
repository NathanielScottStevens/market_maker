defmodule MarketMakerWeb.FallbackController do
  use MarketMakerWeb, :controller

  alias MarketMakerWeb.ErrorView

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("changeset_errors.json", changeset: changeset)
  end

  def call(conn, {:error, error}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("400_generic.json", error: error)
  end
end
