defmodule Bookstore.Writers.Author do
  use Ecto.Schema
  import Ecto.Changeset
  import CustomSQLFunctions
  import Ecto.Query

  @derive {Phoenix.Param, key: :slug}
  schema "authors" do
    field(:biography, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:slug, :string)

    has_many(:books, Bookstore.Inventory.Book)

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:first_name, :last_name, :biography, :slug])
    |> build_slug()
    |> validate_required([:first_name, :last_name, :biography, :slug])
  end

  def alphabetical(query) do
    from(a in query,
      select: %{id: a.id, name: concat(a.last_name, ' ', a.first_name)},
      order_by: a.last_name
    )
  end

  def build_slug(changeset) do
    first_name = get_field(changeset, :first_name)
    last_name = get_field(changeset, :last_name)

    if first_name && last_name do
      name = Enum.join([first_name, last_name], " ")
      slug = Slug.slugify(name)
      put_change(changeset, :slug, slug)
    else
      changeset
    end
  end
end
