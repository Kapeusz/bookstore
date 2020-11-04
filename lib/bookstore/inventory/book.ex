defmodule Bookstore.Inventory.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :author_id, :integer
    field :category_id, :integer
    field :description, :string
    field :image_url, :string
    field :isbn, :string
    field :original_price, :float
    field :published_on, :date
    field :title, :string

    # belongs_to: category, Bookstore.Genres.Category
    # belongs_to: author, Bookstore.Writers.Author

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:author_id, :category_id, :isbn, :title, :description, :published_on, :original_price, :image_url])
    |> validate_required([:isbn, :title, :description, :published_on, :original_price, :image_url])
  end
end
