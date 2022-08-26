defmodule MarketMakerWeb.Schemas.User do
  import Norm

  @spec create(map()) :: {:ok, map()} | {:error, :invalid_user_input}
  def create(params) do
    user_schema =
      schema(%{
        "first_name" => spec(is_binary()),
        "last_name" => spec(is_binary()),
        "email" => spec(is_binary())
      })

    params
    |> conform(selection(user_schema))
    |> transform(
      &%{
        first_name: &1["first_name"],
        last_name: &1["last_name"],
        email: &1["email"]
      }
    )
  end

  defp transform({:ok, params}, fun), do: {:ok, fun.(params)}
  defp transform(_error, _fun), do: {:error, :invalid_user_input}
end
