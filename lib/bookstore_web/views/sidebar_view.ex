defmodule Bookstore.SidebarView do
  use BookstoreWeb, :view
  import Ecto.Query
  alias Bookstore.Genres.Category
  alias Bookstore.Genres

  def show_categories() do
    Genres.list_alphabetical_categories()
  end
end
