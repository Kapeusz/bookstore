defmodule BookstoreWeb.CartController do
  use BookstoreWeb, :controller

  alias Bookstore.Inventory
  alias Bookstore.Workers.CartAgent

  def update(%{assigns: %{current_user: current_user}} = conn, %{"id" => id}) do
    book = Inventory.get_book!(id)
    CartAgent.add_item(current_user.email, book)

    conn
    |> put_flash(:info, "Book added to your cart.")
    |> redirect(to: Routes.book_path(conn, :show, book))
  end

  def delete(%{assigns: %{current_user: current_user}} = conn, %{"id" => id}) do
    book = Inventory.get_book!(id)
    CartAgent.delete_item(current_user.email, book.id)

    conn
    |> put_flash(:info, "Book was removed from your cart.")
    |> redirect(to: Routes.book_path(conn, :show, book))
  end
end
