defmodule MarketMakerWeb.ErrorView do
  use MarketMakerWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.html", _assigns) do
  #   "Internal Server Error"
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end

  def render("changeset_errors.json", %{changeset: changeset}) do
    errors = changeset |> Ecto.Changeset.traverse_errors(fn {msg, _opts} -> msg end)

    %{errors: %{detail: errors}}
  end

  def render("400_generic.json", %{error: error}) do
    error_text = error |> Atom.to_string() |> String.replace("_", " ")
    %{errors: %{detail: error_text}}
  end
end
