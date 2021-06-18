defmodule BookstoreWeb.CartController do
  use BookstoreWeb, :controller

  alias Bookstore.{Carts, Inventory}
  alias Bookstore.Workers.CartAgent
  alias Bookstore.Carts.Cart

  def index(%{assigns: %{current_user: current_user}} = conn, _params) do
    books = Carts.get(current_user.email)
    render(conn, "index.html", books: books)
  end

  def update(%{assigns: %{current_user: current_user}} = conn, %{"id" => id}) do
    book = Inventory.get_book!(id)
    Carts.add(current_user.email, book)

    conn
    |> put_flash(:info, "Book added to your cart")
    |> redirect(to: Routes.book_path(conn, :show, book))
  end

  def delete(%{assigns: %{current_user: current_user}} = conn, %{"book_slug" => id}) do
    book = Inventory.get_book!(id)
    Carts.remove(current_user.email, book.id)

    conn
    |> put_flash(:info, "Book was removed from your cart.")
    |> redirect(to: Routes.cart_path(conn, :index))
  end
end
