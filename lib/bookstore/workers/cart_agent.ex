defmodule Bookstore.Workers.CartAgent do
  use Agent

  def start_link(state, cart_id) do
    Agent.start_link(fn -> state end, name: via_tuple(cart_id))
  end

  def add_item(cart_id, item) do
    Agent.cast(via_tuple(cart_id), fn state ->
      state ++ [item]
    end)
  end

  def delete_item(cart_id, item_id) do
    updated_cart =
      cart_id
      |> get_cart()
      |> Enum.reject(fn cart_item ->
        cart_item.id == item_id
      end)

    Agent.update(via_tuple(cart_id), fn _state ->
      updated_cart
    end)
  end

  def get_cart(cart_id) do
    Agent.get(via_tuple(cart_id), fn state ->
      state
    end)
  end

  defp via_tuple(cart_id) do
    {:via, Registry, {:cart_registry, cart_id}}
  end
end
