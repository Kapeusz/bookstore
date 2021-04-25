defmodule Bookstore.SidebarView do
  use BookstoreWeb, :view
  alias Bookstore.Genres.Category

  def show_categories() do
    Category.list_categories()
  end
end
