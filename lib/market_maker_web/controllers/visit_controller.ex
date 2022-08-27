defmodule MarketMakerWeb.VisitController do
  use MarketMakerWeb, :controller

  alias MarketMaker.Visits
  alias MarketMakerWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    visits = Visits.get_all()
    render(conn, "index.json", visits: visits)
  end

  def show(conn, %{"id" => id}) do
    visit = Visits.get(id)
    render(conn, "show.json", visit: visit)
  end

  def create(conn, params) do
    with {:ok, visit} <- Visits.create(params) do
      render(conn, "show.json", visit: visit)
    end
  end
end
