defmodule MarketMakerWeb.Router do
  use MarketMakerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MarketMakerWeb do
    pipe_through :api

    resources "/users", UserController, only: [:index, :show, :create, :update]
  end
end