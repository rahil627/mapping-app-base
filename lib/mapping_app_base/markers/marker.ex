defmodule MappingAppBase.Markers.Marker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "markers" do
    field :latitude, :float
    field :longitude, :float

    timestamps()
  end

  @doc false
  def changeset(marker, attrs) do
    marker
    |> cast(attrs, [:latitude, :longitude])
    |> validate_required([:latitude, :longitude])
  end
end
