defmodule Bookstore.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :author_id, :integer
      add :category_id, :integer
      add :isbn, :string
      add :title, :string
      add :description, :string
      add :published_on, :date
      add :original_price, :float
      add :image_url, :string

      timestamps()
    end

  end
end
