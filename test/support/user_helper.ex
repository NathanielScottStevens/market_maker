defmodule MarketMakerWeb.UserHelper do
  @moduledoc false
  import Phoenix.ConnTest

  alias MarketMakerWeb.Router.Helpers, as: PathHelper
  alias MarketMaker.Users

  @endpoint MarketMakerWeb.Endpoint

  def data(params \\ %{}) do
    Map.merge(
      %{
        "first_name" => "nathaniel",
        "last_name" => "stevens",
        "email" => "my-email@example.com",
        "minutes" => 60
      },
      params
    )
  end

  def create(conn, params \\ %{}) do
    conn
    |> post(PathHelper.user_path(conn, :create), data(params))
    |> json_response(200)
  end

  def create_from_context(params \\ %{}) do
    {:ok, user} = Users.create(data(params))
    user
  end
end
