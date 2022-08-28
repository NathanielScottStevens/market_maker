defmodule MarketMakerWeb.Router do
  use MarketMakerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MarketMakerWeb do
    pipe_through :api

    resources "/users", UserController, only: [:index, :show, :create]
    resources "/visits", VisitController, only: [:index, :show, :create]
    resources "/transactions", TransactionController, only: [:index, :show, :create]
  end
end
