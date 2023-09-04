defmodule MappingAppBase.Repo.Migrations.CreateMarkers do
  use Ecto.Migration

  def change do
    create table(:markers) do
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end
  end
end
