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

  def full_name(%Writers.Author{first_name: first_name, last_name: last_name}) do
    [first_name, last_name]
    |> Enum.reject(&(&1 == ""))
    |> Enum.join(" ")
  end
end
