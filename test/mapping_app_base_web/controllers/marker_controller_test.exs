defmodule MappingAppBaseWeb.MarkerControllerTest do
  use MappingAppBaseWeb.ConnCase

  import MappingAppBase.MarkersFixtures

  @create_attrs %{latitude: 120.5, longitude: 120.5}
  @update_attrs %{latitude: 456.7, longitude: 456.7}
  @invalid_attrs %{latitude: nil, longitude: nil}

  describe "index" do
    test "lists all markers", %{conn: conn} do
      conn = get(conn, ~p"/markers")
      assert html_response(conn, 200) =~ "Listing Markers"
    end
  end

  describe "new marker" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/markers/new")
      assert html_response(conn, 200) =~ "New Marker"
    end
  end

  describe "create marker" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/markers", marker: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/markers/#{id}"

      conn = get(conn, ~p"/markers/#{id}")
      assert html_response(conn, 200) =~ "Marker #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/markers", marker: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Marker"
    end
  end

  describe "edit marker" do
    setup [:create_marker]

    test "renders form for editing chosen marker", %{conn: conn, marker: marker} do
      conn = get(conn, ~p"/markers/#{marker}/edit")
      assert html_response(conn, 200) =~ "Edit Marker"
    end
  end

  describe "update marker" do
    setup [:create_marker]

    test "redirects when data is valid", %{conn: conn, marker: marker} do
      conn = put(conn, ~p"/markers/#{marker}", marker: @update_attrs)
      assert redirected_to(conn) == ~p"/markers/#{marker}"

      conn = get(conn, ~p"/markers/#{marker}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, marker: marker} do
      conn = put(conn, ~p"/markers/#{marker}", marker: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Marker"
    end
  end

  describe "delete marker" do
    setup [:create_marker]

    test "deletes chosen marker", %{conn: conn, marker: marker} do
      conn = delete(conn, ~p"/markers/#{marker}")
      assert redirected_to(conn) == ~p"/markers"

      assert_error_sent 404, fn ->
        get(conn, ~p"/markers/#{marker}")
      end
    end
  end

  defp create_marker(_) do
    marker = marker_fixture()
    %{marker: marker}
  end
end
