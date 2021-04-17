defmodule BookstoreWeb.PageController do
  use BookstoreWeb, :controller

  alias Bookstore.Repo
  alias Bookstore.Inventory
  alias Bookstore.Inventory.Book
  alias Bookstore.Genres
  alias Bookstore.Genres.Category
  alias Bookstore.Writers.Author
  alias Bookstore.Writers

  plug(:load_categories when action in [:new, :create, :edit, :update])
  plug(:load_authors when action in [:new, :create, :edit, :update])
  # plug :load_author_full_name when action in [:index, :show]

  defp load_categories(conn, _) do
    assign(conn, :categories, Bookstore.Genres.list_alphabetical_categories())
  end

  defp load_authors(conn, _) do
    assign(conn, :authors, Bookstore.Writers.list_alphabetical_authors())
  end

  def index(conn, _params) do
    books = Inventory.newest_books()
    render(conn, "index.html", books: books)
  end

end
