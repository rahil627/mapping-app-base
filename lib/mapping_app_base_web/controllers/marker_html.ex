defmodule MappingAppBaseWeb.MarkerHTML do
  use MappingAppBaseWeb, :html

  embed_templates "marker_html/*"

  @doc """
  Renders a marker form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def marker_form(assigns)
end
