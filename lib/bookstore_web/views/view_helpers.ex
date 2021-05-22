defmodule BookstoreWeb.ViewHelpers do
  import Ecto.Query
  alias Bookstore.BookController

  def create_order_url(conn, field_name, allowed_keys \\ ["query"]) do
    Phoenix.Controller.current_url(conn, get_order_params(conn.params, allowed_keys, field_name))
  end

  defp get_order_params(params, allowed_keys, order_key) do
    params
    |> Map.take(allowed_keys ++ ["order_by"])
    |> Enum.map(fn {k, v} -> {String.to_atom(k), v} end)
    |> Map.new()
    |> Map.update(
      :order_by,
      order_key,
      &case &1 do
        "-" <> ^order_key -> order_key
        ^order_key -> "-" <> order_key
        _ -> "-" <> order_key
      end
    )
  end

  def sort_by_params(qs, %{"order_by" => "-" <> val}, allowed),
    do: do_sort_by_params(qs, val, :asc, allowed)

  def sort_by_params(qs, %{"order_by" => val}, allowed),
    do: do_sort_by_params(qs, val, :desc, allowed)

  def sort_by_params(qs, _, _), do: qs

  defp do_sort_by_params(qs, val, ord, allowed) do
    if val in allowed do
      [binding, name] = val |> String.split("__") |> Enum.map(&String.to_atom/1)
      qs |> order_by([{^binding, t}], [{^ord, field(t, ^name)}])
    else
      qs
    end
  end
end
