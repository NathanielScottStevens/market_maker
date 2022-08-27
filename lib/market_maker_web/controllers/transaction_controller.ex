defmodule MarketMakerWeb.TransactionController do
  use MarketMakerWeb, :controller

  alias MarketMaker.Transactions
  alias MarketMakerWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    transactions = Transactions.get_all()
    render(conn, "index.json", transactions: transactions)
  end

  def show(conn, %{"id" => id}) do
    transaction = Transactions.get(id)
    render(conn, "show.json", transaction: transaction)
  end

  def create(conn, params) do
    with {:ok, transaction} <- Transactions.create(params) do
      render(conn, "show.json", transaction: transaction)
    end
  end
end
