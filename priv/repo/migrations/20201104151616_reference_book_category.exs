defmodule Bookstore.Repo.Migrations.ReferenceBookCategory do
  use Ecto.Migration

  def change do
    alter table(:books) do
      modify :category_id, references(:categories)
    end
  end
end
