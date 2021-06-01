defmodule BookstoreWeb.LayoutView do
  use BookstoreWeb, :view
  import BookstoreWeb.ViewHelpers

  alias Bookstore.Views.CategoryView
  alias Bookstore.Genres
  alias Bookstore.Genres.Category
  alias BookstoreWeb.ViewHelpers
  alias Bookstore.Workers.CartAgent

  def show_categories() do
    Genres.list_categories()
  end

  def cart_item_count(current_user) do
    case CartAgent.get_cart(current_user.email) do
      nil ->
        0

      cart ->
        Enum.count(cart)
    end
  end
end
