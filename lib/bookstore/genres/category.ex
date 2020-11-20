defmodule Bookstore.Genres.Category do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Bookstore.Inventory

  schema "categories" do
    field :name, :string

    has_many :books, Bookstore.Inventory.Book

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def alphabetical(query) do
    from c in query, order_by: c.name
  end
end
