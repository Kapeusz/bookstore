defmodule Bookstore.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add(:status, :string)
      add(:total, :decimal)
      add(:line_books, {:array, :map})

      timestamps()
    end
  end
end
