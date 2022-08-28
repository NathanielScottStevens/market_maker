defmodule MarketMakerWeb.VisitHelper do
  @moduledoc false
  import Phoenix.ConnTest

  alias MarketMakerWeb.Router.Helpers, as: PathHelper

  @endpoint MarketMakerWeb.Endpoint

  def data(user_id, params \\ %{}) do
    Map.merge(
      %{
        "user_id" => user_id,
        "date" => "2022-01-25",
        "minutes" => 90,
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
end
