defmodule Bookstore.Repo.Migrations.AddQuantityToBooks do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add(:quantity, :integer)
    end
  end
end
