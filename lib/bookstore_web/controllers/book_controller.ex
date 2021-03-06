defmodule BookstoreWeb.BookController do
  use BookstoreWeb, :controller
  import Ecto.Query
  alias BookstoreWeb.Views.ViewHelpers
  alias BookstoreWeb.Views
  alias BookstoreWeb
  alias Bookstore.Repo
  alias Bookstore.Inventory
  alias Bookstore.Inventory.Book
  alias Bookstore.Genres
  alias Bookstore.Genres.Category
  alias Bookstore.Writers.Author
  alias Bookstore.Writers

  plug(:load_categories when action in [:new, :create, :edit, :update])
  plug(:load_authors when action in [:new, :create, :edit, :update])
  plug(:load_publishers when action in [:new, :create, :edit, :update])
  # plug :load_author_full_name when action in [:index, :show]

  defp load_categories(conn, _) do
    assign(conn, :categories, Bookstore.Genres.list_alphabetical_categories())
  end

  defp load_authors(conn, _) do
    assign(conn, :authors, Bookstore.Writers.list_alphabetical_authors())
  end

  defp load_publishers(conn, _) do
    assign(conn, :publishers, Bookstore.Media.list_alphabetical_publishers())
  end

  @book_sort_fields [
    "book__title",
    "book__original_price"
  ]


  def index(conn, params) do
    search_term = get_in(params, ["query"])
    sort_params = get_in(params, ["order_by"])
    books = Bookstore.Inventory.list_books(params)
    |> Repo.paginate(params)
    render(conn, "index.html",
      books: books.entries,
      page: books,
      query: search_term,
      order_by: sort_params
    )
  end

  def new(conn, _params) do
    changeset = Inventory.change_book(%Book{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"book" => book_params}) do
    case Inventory.create_book(book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Inventory.get_book!(id)
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"id" => id}) do
    book = Inventory.get_book!(id)
    changeset = Inventory.change_book(book)
    render(conn, "edit.html", book: book, changeset: changeset)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Inventory.get_book!(id)

    case Inventory.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", book: book, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Inventory.get_book!(id)
    {:ok, _book} = Inventory.delete_book(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: Routes.book_path(conn, :index))
  end
end
