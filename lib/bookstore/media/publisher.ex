defmodule Bookstore.Media.Publisher do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  @derive {Phoenix.Param, key: :slug}
  schema "publishers" do
    field(:email, :string)
    field(:name, :string)
    field(:slug, :string)

    has_many(:books, Bookstore.Inventory.Book)

    timestamps()
  end

  @doc false
  def changeset(publisher, attrs) do
    publisher
    |> cast(attrs, [:name, :email, :slug])
    |> build_slug()
    |> validate_required([:name, :email])
  end

  def alphabetical(query) do
    from(p in query, order_by: p.name)
  end

  defp build_slug(changeset) do
    if name = get_field(changeset, :name) do
      slug = Slug.slugify(name)
      put_change(changeset, :slug, slug)
    else
      changeset
    end
  end
end
