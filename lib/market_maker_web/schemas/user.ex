defmodule MarketMakerWeb.Schemas.User do
  import Norm

  @spec create(map()) :: {:ok, map()} | {:error, :invalid_user_input}
  def create(params) do
    params
    |> conform(selection(schema()))
    |> transform(
      &%{
        first_name: &1["first_name"],
        last_name: &1["last_name"],
        email: &1["email"]
      }
    )
  end

  @spec schema() :: Norm.Schema.t()
  def schema do
    schema(%{
      "first_name" => spec(is_binary() and (&(String.length(&1) > 0))),
      "last_name" => spec(is_binary() and (&(String.length(&1) > 0))),
      "email" => spec(is_binary() and (&(String.length(&1) > 0)))
    })
  end

  defp transform({:ok, params}, fun), do: {:ok, fun.(params)}
  defp transform(_error, _fun), do: {:error, :invalid_user_input}
end
