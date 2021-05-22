defmodule BookstoreWeb.AuthorView do
  use BookstoreWeb, :view
  import BookstoreWeb.ViewHelpers
  alias BookstoreWeb.Uploaders.ImageUploader
  alias Bookstore.Inventory
  alias Bookstore.Inventory.Book
  alias BookstoreWeb.ViewHelpers

  def book_img(book, version) do
    {book.image_url, book}
    |> ImageUploader.url(version)
    |> img_tag()
  end

  def name_case(name) do
    split_name =
      String.replace(name, "-", " ")
      |> String.downcase()

    String.split(split_name)
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end
end
