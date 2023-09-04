defmodule MappingAppBase.MarkersTest do
  use MappingAppBase.DataCase

  alias MappingAppBase.Markers

  describe "markers" do
    alias MappingAppBase.Markers.Marker

    import MappingAppBase.MarkersFixtures

    @invalid_attrs %{latitude: nil, longitude: nil}

    test "list_markers/0 returns all markers" do
      marker = marker_fixture()
      assert Markers.list_markers() == [marker]
    end

    test "get_marker!/1 returns the marker with given id" do
      marker = marker_fixture()
      assert Markers.get_marker!(marker.id) == marker
    end

    test "create_marker/1 with valid data creates a marker" do
      valid_attrs = %{latitude: 120.5, longitude: 120.5}

      assert {:ok, %Marker{} = marker} = Markers.create_marker(valid_attrs)
      assert marker.latitude == 120.5
      assert marker.longitude == 120.5
    end

    test "create_marker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Markers.create_marker(@invalid_attrs)
    end

    test "update_marker/2 with valid data updates the marker" do
      marker = marker_fixture()
      update_attrs = %{latitude: 456.7, longitude: 456.7}

      assert {:ok, %Marker{} = marker} = Markers.update_marker(marker, update_attrs)
      assert marker.latitude == 456.7
      assert marker.longitude == 456.7
    end

    test "update_marker/2 with invalid data returns error changeset" do
      marker = marker_fixture()
      assert {:error, %Ecto.Changeset{}} = Markers.update_marker(marker, @invalid_attrs)
      assert marker == Markers.get_marker!(marker.id)
    end

    test "delete_marker/1 deletes the marker" do
      marker = marker_fixture()
      assert {:ok, %Marker{}} = Markers.delete_marker(marker)
      assert_raise Ecto.NoResultsError, fn -> Markers.get_marker!(marker.id) end
    end

    test "change_marker/1 returns a marker changeset" do
      marker = marker_fixture()
      assert %Ecto.Changeset{} = Markers.change_marker(marker)
    end
  end
end
