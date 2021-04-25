defmodule Bookstore.Repo.Migrations.AddYearPublishedToBooksTable do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add(:year_published, :integer, size: 4)
    end
  end
end
