defmodule MappingAppBase.Repo do
  use Ecto.Repo,
    otp_app: :mapping_app_base,
    adapter: Ecto.Adapters.Postgres
end
