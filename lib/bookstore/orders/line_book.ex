# defmodule Bookstore.Orders.LineBook do
#   use Ecto.Schema

#   embedded_schema do
#     field(:book_id, :integer)
#     field(:book_title, :string)
#     field(:quantity, :integer)
#     field(:original_price, :string)
#     field(:total, :decimal)
#   end

#   @doc false
#   def changeset(%LineBook{} = line_book, attrs) do
#     line_item
#     |> cast(attrs, [:book_id, :book_title, :quantity, :original_price, :total])
#     |> set_book_details
#     |> set_total
#     |> validate_required([:book_id, :book_title, :quantity, :original_price])
#   end

#   defp set_book_details(changeset) do
#     case get_change(changeset, :book_id) do
#       nil ->
#         changeset

#       book_id ->
#         product = Inventory.get_book!(book_id)

#         changeset
#         |> put_change(:book_title, book.title)
#         |> put_change(:unit_price, book.original_price)
#     end
#   end

#   defp set_total(changeset) do
#     quantity = get_field(changeset, :quantity) |> Decimal.new()
#     original_price = get_field(changeset, :original_price)

#     changeset
#     |> put_change(:total, Decimal.mult(original_price, quantity))
#   end
# end
