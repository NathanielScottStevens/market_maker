defmodule MarketMakerWeb.TransactionView do
  use MarketMakerWeb, :view

  def render("show.json", %{transaction: transaction}) do
    %{
      id: transaction.id,
      visit_id: transaction.visit_id,
      owner_id: transaction.owner_id,
      provider_id: transaction.provider_id
    }
  end

  def render("index.json", %{transactions: transactions}) do
    render_many(transactions, __MODULE__, "show.json")
  end
end
