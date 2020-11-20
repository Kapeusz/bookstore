defmodule BookstoreWeb.CategoryView do
  use BookstoreWeb, :view

  alias BookstoreWeb.Uploaders.ImageUploader
  alias Bookstore.Inventory
  alias Bookstore.Inventory.Book

  def name_case(name) do
    name
    |> String.downcase
    |> String.capitalize
  end

  def book_img(book, version) do
    {book.image_url, book}
    |> ImageUploader.url(version)
    |> img_tag()
  end
end
