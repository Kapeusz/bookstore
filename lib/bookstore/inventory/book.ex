defmodule Bookstore.Inventory.Book do
  use Ecto.Schema
  import Ecto.Changeset
  import CustomSQLFunctions
  import Ecto.Query
  use Waffle.Ecto.Schema

  alias Bookstore.Repo

  schema "books" do
    field :description, :string
    field :image_url, BookstoreWeb.Uploaders.ImageUploader.Type
    field :isbn, :string
    field :original_price, :float
    field :published_on, :date
    field :title, :string

    belongs_to :category, Bookstore.Genres.Category
    belongs_to :author, Bookstore.Writers.Author

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:author_id, :category_id, :isbn, :title, :description, :published_on, :original_price])
    |> validate_required([:isbn, :title, :description, :published_on, :original_price])
    |> cast_attachments(attrs, [:image_url])
  end

  # def get_author_full_name(author) do
  #   from b in "books",
  #   join: a in "authors",
  #   on: b.author_id == a.id,
  #   where: a.id == ^author,
  #   select: %{id: a.id, name: concat(a.first_name, ' ', a.last_name)}
  # end

  def author_full_name(author) do
    from(b in Book, preload: [:authors])  |> Repo.all()
  end

  def books_by_category(name) do
    from(b in Bookstore.Inventory.Book,
    join: c in assoc(b, :category),
    join: a in assoc(b, :author),
    where: fragment("LOWER(?)", c.name) == ^name)
    |> Repo.all()
    |> Repo.preload(:author)
  end

  def books_by_author(name) do
    from(b in Bookstore.Inventory.Book,
    join: a in assoc(b, :author),
    where: a.slug == ^name)
    |> Repo.all()
    |> Repo.preload(:author)
  end

  def recent_books(inserted_at) do
    from(b in Bookstore.Inventory.Book, limit: 15, order_by: [desc: b.inserted_at]) |> Repo.all() |> Repo.preload(:author)
  end
end
