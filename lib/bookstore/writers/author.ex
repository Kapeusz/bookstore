defmodule Bookstore.Writers.Author do
  use Ecto.Schema
  import Ecto.Changeset
  import CustomSQLFunctions
  import Ecto.Query

  schema "authors" do
    field :biography, :string
    field :first_name, :string
    field :last_name, :string

    has_many :books, Bookstore.Inventory.Book

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:first_name, :last_name, :biography])
    |> validate_required([:first_name, :last_name, :biography])
  end

  def alphabetical(query) do
    from a in query,
    select: %{id: a.id, name: concat(a.last_name, ' ', a.first_name)},
    order_by: a.last_name
  end
end
