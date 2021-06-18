defmodule Bookstore.Orders do
  alias Bookstore.Repo
  alias Bookstore.Orders.Order

  import Ecto.Query, warn: false

  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  # def confirm_order(%Order{} = order, attrs) do
  #   attrs = Map.put(attrs, "status", "Confirmed")

  #   order
  #   |> Order.checkout_changeset(attrs)
  #   |> Repo.update()
  # end

  # def merge_order_params(order, user) do

  # end

  # def change_cart(%Order{} = order) do
  #   Order.changeset(order, %{})
  # end
end
