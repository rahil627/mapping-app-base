defmodule MappingAppBaseWeb.PageController do
  use MappingAppBaseWeb, :controller

  # actions
  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    markers = MappingAppBaseWeb.Markers |> MappingAppBase.Markers.list_markers()
    render(conn, :home, markers: markers)
    #render(conn, :home) # layout: false
  end

end
