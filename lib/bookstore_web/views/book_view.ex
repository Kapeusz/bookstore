defmodule BookstoreWeb.BookView do
  use BookstoreWeb, :view
  alias BookstoreWeb.Uploaders.ImageUploader

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
end
