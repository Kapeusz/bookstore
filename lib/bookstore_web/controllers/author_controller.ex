defmodule BookstoreWeb.AuthorController do
  use BookstoreWeb, :controller

  alias Bookstore.Writers
  alias Bookstore.Writers.Author

  def index(conn, _params) do
    authors = Writers.list_authors()
    render(conn, "index.html", authors: authors)
  end

  def new(conn, _params) do
    changeset = Writers.change_author(%Author{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"author" => author_params}) do
    case Writers.create_author(author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author created successfully.")
        |> redirect(to: Routes.author_path(conn, :show, author))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Writers.get_author!(id)
    render(conn, "show.html", author: author)
  end

  def show_author_books(conn, %{"name" => name}) do
    books = Bookstore.Inventory.Book.books_by_author(name)
    conn
    |> assign(:books, books)
    |> assign(:name, name)
    |> render("show_books.html")
  end

  def edit(conn, %{"id" => id}) do
    author = Writers.get_author!(id)
    changeset = Writers.change_author(author)
    render(conn, "edit.html", author: author, changeset: changeset)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Writers.get_author!(id)

    case Writers.update_author(author, author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author updated successfully.")
        |> redirect(to: Routes.author_path(conn, :show, author))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", author: author, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Writers.get_author!(id)
    {:ok, _author} = Writers.delete_author(author)

    conn
    |> put_flash(:info, "Author deleted successfully.")
    |> redirect(to: Routes.author_path(conn, :index))
  end
end
