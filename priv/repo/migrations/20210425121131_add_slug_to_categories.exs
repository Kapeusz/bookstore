defmodule Bookstore.Repo.Migrations.AddSlugToCategories do
  use Ecto.Migration

  def change do
    alter table(:categories) do
      add :slug, :string
  end

  create index(:categories, [:slug])
  end
end
