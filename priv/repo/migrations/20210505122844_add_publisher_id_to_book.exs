defmodule Bookstore.Repo.Migrations.AddPublisherIdToBook do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add(:publisher_id, references(:publishers))
    end
  end
end
