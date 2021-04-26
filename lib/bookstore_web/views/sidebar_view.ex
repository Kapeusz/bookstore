defmodule Bookstore.SidebarView do
  use BookstoreWeb, :view
  import Ecto.Query
  alias Bookstore.Genres.Category
  alias Bookstore.Genres

  def show_categories() do
    Category.category_dropdown()
  end
end
