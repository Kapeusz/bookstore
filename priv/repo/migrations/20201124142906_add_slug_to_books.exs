defmodule Bookstore.Repo.Migrations.AddSlugToBooks do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :slug, :string
    end

    create index(:books, [:slug])
  end
end
