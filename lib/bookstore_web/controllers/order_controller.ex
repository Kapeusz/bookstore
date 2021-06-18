defmodule BookstoreWeb.OrderController do
  use BookstoreWeb, :controller

  alias Bookstore.{Carts, Inventory}
  alias Bookstore.Workers.CartAgent
  alias Bookstore.Orders

  # def edit(%{assigns: %{current_user: current_user}} = conn, _params) do
  #   order = Carts.get(current_user.email)
  #   order_changeset = Bookstore.Orders.change_order(order, conn)

  #   render(conn, "edit.html",
  #     order: order,
  #     order_changeset: order_changeset
  #   )
  # end

  # def create(conn, books) do

  # end

  # def new_order_params(conn, params) do
  #   books = Carts.get(current_user.email)

  #   params
  #   |> Map.put("book_id", book.id)
  #   |> Map.put("book_title", book.title)
  # end

  # def new(conn, _params) do
  #   user = conn.assigns.current_user
  #   order = Carts.get(user.email)
  #   order_changeset = Orders.change_cart(order, user)

  #   render(conn, "new.html",
  #     order: order,
  #     order_changeset: order_changeset
  #   )
  # end

  # def create(%{assigns: %{current_user: current_user}} = conn, %{"books" => order_params}) do
  #   books = Carts.get(current_user.email)
  #   order_params = associate_user_from_session(conn, books)

  #   case Orders.confirm_order(books, order_params) do
  #     {:ok, _} ->
  #       conn
  #       |> put_flash(:info, "Order has been confirmed.")
  #       |> redirect(to: "/")

  #     {:error, order_changeset} ->
  #       render(conn, "new.html", books: books, order_changeset: order_changeset)
  #   end
  # end

  # def associate_user_from_session(conn, params) do
  #   user = conn.assigns.current_user

  #   params
  #   |> Map.put("user_id", user.id)
  #   |> Map.put("email", user.email)
  # end
end
