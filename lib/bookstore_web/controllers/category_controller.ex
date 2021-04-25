defmodule BookstoreWeb.CategoryController do
  use BookstoreWeb, :controller
  alias Bookstore.Inventory
  alias Bookstore.Inventory.Book
  alias Bookstore.Genres
  alias Bookstore.Genres.Category

  def index(conn, _params) do
    categories = Genres.list_alphabetical_categories()
    render(conn, "index.html", categories: categories)
  end

  def new(conn, _params) do
    changeset = Genres.change_category(%Category{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"category" => category_params}) do
    case Genres.create_category(category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category created successfully.")
        |> redirect(to: Routes.category_path(conn, :show, category))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Genres.get_category!(id)
    render(conn, "show.html", category: category)
  end

  def show_books(conn, %{"name" => name}) do
    books = Bookstore.Inventory.Book.books_by_category(name)

    conn
    |> assign(:books, books)
    |> assign(:name, name)
    |> render("show_books.html")
  end

  def edit(conn, %{"id" => id}) do
    category = Genres.get_category!(id)
    changeset = Genres.change_category(category)
    render(conn, "edit.html", category: category, changeset: changeset)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Genres.get_category!(id)

    case Genres.update_category(category, category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category updated successfully.")
        |> redirect(to: Routes.category_path(conn, :show, category))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", category: category, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Genres.get_category!(id)
    {:ok, _category} = Genres.delete_category(category)

    conn
    |> put_flash(:info, "Category deleted successfully.")
    |> redirect(to: Routes.category_path(conn, :index))
  end
end
