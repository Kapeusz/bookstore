defmodule BookstoreWeb.BookController do
  use BookstoreWeb, :controller

  alias Bookstore.Inventory
  alias Bookstore.Inventory.Book
  alias Bookstore.Genres
  alias Bookstore.Genres.Category

  plug :load_categories when action in [:new, :create, :edit, :update]


  defp load_categories(conn, _) do
    assign(conn, :categories, Bookstore.Genres.list_alphabetical_categories())
  end

  def index(conn, _params) do
    books = Inventory.list_books()
    render(conn, "index.html", books: books)
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
