defmodule BookstoreWeb.PageView do
  use BookstoreWeb, :view

  alias BookstoreWeb.Uploaders.ImageUploader
  alias Bookstore.Writers
  alias Bookstore.Writers.Author
  alias Bookstore.Views.BookView
  alias Bookstore.Inventory
  alias Bookstore.Inventory.Book

  def name_case(name) do
    name
    |> String.downcase()
    |> String.capitalize()
  end

  def category_select_options(categories) do
    for category <- categories, do: {category.name, category.id}
  end

  def author_select_options(authors) do
    for author <- authors, do: {author.name, author.id}
  end

  def book_img(book, version) do
    {book.image_url, book}
    |> ImageUploader.url(version)
    |> img_tag()
  end

  def full_name(%Writers.Author{first_name: first_name, last_name: last_name}) do
    [first_name, last_name]
    |> Enum.reject(&(&1 == ""))
    |> Enum.join(" ")
  end

  def book_img_without_img_tag(book, version) do
    {book.image_url, book}
    |> ImageUploader.url(version)
  end
end
