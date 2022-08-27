defmodule MarketMakerWeb.VisitView do
  use MarketMakerWeb, :view

  def render("show.json", %{visit: visit}) do
    %{
      id: visit.id,
      user_id: visit.user_id,
      date: visit.date,
      minutes: visit.minutes,
      tasks: visit.tasks
    }
  end

  def render("index.json", %{visits: visits}) do
    render_many(visits, __MODULE__, "show.json")
  end
end
