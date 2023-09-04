defmodule MappingAppBaseWeb.MarkerController do
  use MappingAppBaseWeb, :controller

  alias MappingAppBase.Markers
  alias MappingAppBase.Markers.Marker

  def index(conn, _params) do
    markers = Markers.list_markers()
    render(conn, :index, markers: markers)
  end

  def new(conn, _params) do
    changeset = Markers.change_marker(%Marker{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"marker" => marker_params}) do
    case Markers.create_marker(marker_params) do
      {:ok, marker} ->
        conn
        |> put_flash(:info, "Marker created successfully.")
        |> redirect(to: ~p"/markers/#{marker}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    marker = Markers.get_marker!(id)
    render(conn, :show, marker: marker)
  end

  def edit(conn, %{"id" => id}) do
    marker = Markers.get_marker!(id)
    changeset = Markers.change_marker(marker)
    render(conn, :edit, marker: marker, changeset: changeset)
  end

  def update(conn, %{"id" => id, "marker" => marker_params}) do
    marker = Markers.get_marker!(id)

    case Markers.update_marker(marker, marker_params) do
      {:ok, marker} ->
        conn
        |> put_flash(:info, "Marker updated successfully.")
        |> redirect(to: ~p"/markers/#{marker}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, marker: marker, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    marker = Markers.get_marker!(id)
    {:ok, _marker} = Markers.delete_marker(marker)

    conn
    |> put_flash(:info, "Marker deleted successfully.")
    |> redirect(to: ~p"/markers")
  end
end
