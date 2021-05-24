defmodule BookstoreWeb.SidebarView do
  use BookstoreWeb, :view
  import Ecto.Query
  import BookstoreWeb.ViewHelpers
  alias BookstoreWeb.ViewHelpers
  alias Bookstore.Genres.Category
  alias Bookstore.Genres

  def show_categories() do
    Genres.list_alphabetical_categories()
  end
end
