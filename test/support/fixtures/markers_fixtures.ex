defmodule MappingAppBase.MarkersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MappingAppBase.Markers` context.
  """

  @doc """
  Generate a marker.
  """
  def marker_fixture(attrs \\ %{}) do
    {:ok, marker} =
      attrs
      |> Enum.into(%{
        latitude: 120.5,
        longitude: 120.5
      })
      |> MappingAppBase.Markers.create_marker()

    marker
  end
end
