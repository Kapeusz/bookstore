defmodule BookstoreWeb.CategoryView do
  use BookstoreWeb, :view

  alias BookstoreWeb.Uploaders.ImageUploader
  alias Bookstore.Inventory
  alias Bookstore.Inventory.Book
  alias BookstoreWeb.CategoryController
  alias Bookstore.Writers
  alias Bookstore.Writers.Author
  def name_case(name) do
    name
    |> String.downcase()
    |> String.capitalize()
  end

  def book_img(book, version) do
    {book.image_url, book}
    |> ImageUploader.url(version)
    |> img_tag()
  end

  def show_category_books(name) do
    CategoryController.show_category_books()
  end

  def book_img_without_img_tag(book, version) do
    {book.image_url, book}
    |> ImageUploader.url(version)
  end

  def full_name(%Writers.Author{first_name: first_name, last_name: last_name}) do
    [first_name, last_name]
    |> Enum.reject(&(&1 == ""))
    |> Enum.join(" ")
  end
end
