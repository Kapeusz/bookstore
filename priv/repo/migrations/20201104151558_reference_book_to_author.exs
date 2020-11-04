defmodule Bookstore.Repo.Migrations.ReferenceBookToAuthor do
  use Ecto.Migration

  def change do
    alter table(:books) do
      modify :author_id, references(:authors)
    end
  end
end
