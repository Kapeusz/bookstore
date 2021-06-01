defmodule Bookstore.Workers.CartAgent do
  use Agent

  def start_link(_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def add_item(cart_id, item) do
    Agent.cast(__MODULE__, fn state ->
      Map.update(state, cart_id, [item], &(&1 ++ [item]))
    end)
  end

  def delete_item(cart_id, item_id) do
    updated_cart =
      cart_id
      |> get_cart()
      |> Enum.reject(fn cart_item ->
        cart_item.id == item_id
      end)

    Agent.update(__MODULE__, fn state ->
      Map.merge(state, %{cart_id => updated_cart})
    end)
  end

  def get_cart(cart_id) do
    Agent.get(__MODULE__, fn state ->
      state[cart_id]
    end)
  end
end
