defmodule MarketMakerWeb.VisitHelper do
  @moduledoc false
  import Phoenix.ConnTest

  alias MarketMakerWeb.Router.Helpers, as: PathHelper
  alias MarketMaker.Visits

  @endpoint MarketMakerWeb.Endpoint

  def data(user_id, params \\ %{}) do
    Map.merge(
      %{
        "user_id" => user_id,
        "date" => "2022-01-25",
        "minutes" => 30,
        "tasks" => "Take out garbage"
      },
      params
    )
  end

  def create(conn, user_id, params \\ %{}) do
    conn
    |> post(PathHelper.visit_path(conn, :create), data(user_id, params))
    |> json_response(200)
  end

  def create_from_context(user_id, params \\ %{}) do
    {:ok, visits} = Visits.create(data(user_id, params))
    visits
  end
end
