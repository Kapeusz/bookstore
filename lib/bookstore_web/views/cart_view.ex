defmodule BookstoreWeb.CartView do
  use BookstoreWeb, :view
  import BookstoreWeb.ViewHelpers
  import Scrivener.HTML
  alias BookstoreWeb.Uploaders.ImageUploader
  alias Bookstore.Writers
  alias Bookstore.Writers.Author
  alias Bookstore.Media
  alias Bookstore.Media.Publisher
  alias BookstoreWeb.ViewHelpers
  alias Bookstore.Carts
  alias Bookstore.Inventory
  alias Bookstore.Inventory.Books

  def total_price(books) do
    shipping = 5.99

    price_with_shipping =
      Enum.reduce(books, 0, fn %{original_price: price}, acc ->
        price + acc
      end)

    total_amount = price_with_shipping + shipping
    "Total amount: £#{total_amount}"
  end
end
