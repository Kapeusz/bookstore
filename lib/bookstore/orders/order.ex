defmodule Bookstore.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Bookstore.Workers.{CartAgent, CartSupervisor}

  schema "orders" do
    field(:status, :string)
    field(:total, :string)
    field(:line_books, {:array, :map})
    field(:user_id, :integer)
    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:total, :status, :line_books, :email])
    |> validate_required([:total, :status, :line_books, :user_id, :email])
  end

  # defp set_total(changeset) do
  #   quantity = get_field(changeset, :quantity) |> Decimal.new()
  #   original_price = get_field(changeset, :original_price)

  #   changeset
  #   |> put_change(:total, Decimal.mult(original_price, quantity))
  # end
end
