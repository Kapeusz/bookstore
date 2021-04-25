defmodule Bookstore.Genres.Category do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Bookstore.Inventory
  @derive {Phoenix.Param, key: :slug}
  schema "categories" do
    field :name, :string
    field :slug, :string

    has_many :books, Bookstore.Inventory.Book

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :slug])
    |> build_slug()
    |> validate_required([:name, :slug])
  end

  def alphabetical(query) do
    from c in query, order_by: c.name
  end

  def build_slug(changeset) do
    if name = get_field(changeset, :name) do
      slug = Slug.slugify(name)
      put_change(changeset, :slug, slug)
    else
      changeset
    end
  end

end
