defmodule BookstoreWeb.LayoutView do
  use BookstoreWeb, :view

  alias Bookstore.Views.CategoryView
  alias Bookstore.Genres
  alias Bookstore.Genres.Category

  def show_categories() do
    Genres.list_categories()
  end
end
