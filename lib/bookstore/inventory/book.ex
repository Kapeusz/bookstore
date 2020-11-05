defmodule Bookstore.Inventory.Book do
  use Ecto.Schema
  import Ecto.Changeset
  use Waffle.Ecto.Schema

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
    |> cast(attrs, [:author_id, :isbn, :title, :description, :published_on, :original_price])
    |> validate_required([:isbn, :title, :description, :published_on, :original_price])
    |> cast_attachments(attrs, [:image_url])
  end
end
