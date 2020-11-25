defmodule Bookstore.Repo.Migrations.AddSlugToAuthors do
  use Ecto.Migration

  def change do
    alter table(:authors) do
      add :slug, :string
    end
    create index(:authors, [:slug])
  end
end
