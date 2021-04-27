defmodule Bookstore.RecentBooksView do
  use BookstoreWeb, :view
  import Ecto.Query
  alias Bookstore.Inventory.Book

  def show_categories() do
    Category.list_books()
  end
end
