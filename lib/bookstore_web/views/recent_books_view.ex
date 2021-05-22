defmodule Bookstore.RecentBooksView do
  use BookstoreWeb, :view
  import Ecto.Query
  import BookstoreWeb.ViewHelpers
  alias Bookstore.Inventory.Book
  alias BookstoreWeb.ViewHelpers

  def show_categories() do
    Category.list_books()
  end
end
