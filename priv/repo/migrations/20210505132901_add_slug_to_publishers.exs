defmodule Bookstore.Repo.Migrations.AddSlugToPublishers do
  use Ecto.Migration

  def change do
    alter table(:publishers) do
      add(:slug, :string)
    end

    create(index(:publishers, [:slug]))
  end
end
