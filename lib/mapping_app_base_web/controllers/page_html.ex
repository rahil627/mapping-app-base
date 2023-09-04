defmodule MappingAppBaseWeb.PageHTML do
  use MappingAppBaseWeb, :html

  # can create a function here or put it in a seperate file ("template")
  # def home(assigns) do
  #   ~H""" #~H signal
  #   Hello!
  #   """
  # end

  embed_templates "page_html/*"
end
