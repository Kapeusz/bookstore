defmodule BookstoreWeb.LayoutView do
  use BookstoreWeb, :view
  import BookstoreWeb.ViewHelpers

  alias Bookstore.Views.CategoryView
  alias Bookstore.Genres
  alias Bookstore.Genres.Category
  alias BookstoreWeb.ViewHelpers

  def show_categories() do
    Genres.list_categories()
  end
end
