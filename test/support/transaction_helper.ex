defmodule MarketMakerWeb.TransactionHelper do
  @moduledoc false
  import Phoenix.ConnTest

  alias MarketMakerWeb.Router.Helpers, as: PathHelper
  alias MarketMaker.Transactions

  @endpoint MarketMakerWeb.Endpoint

  def data(owner_id, provider_id, visit_id) do
    %{
      "owner_id" => owner_id,
      "provider_id" => provider_id,
      "visit_id" => visit_id
    }
  end

  def create(conn, owner_id, provider_id, visit_id) do
    conn
    |> post(PathHelper.transaction_path(conn, :create), data(owner_id, provider_id, visit_id))
    |> json_response(200)
  end

  def create_from_context(owner_id, provider_id, visit_id) do
    {:ok, transaction} = Transactions.create(data(owner_id, provider_id, visit_id))
    transaction
  end
end
