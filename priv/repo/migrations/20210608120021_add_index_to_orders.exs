defmodule Bookstore.Repo.Migrations.AddIndexToOrders do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      remove(:user_id)
      add(:user_id, references(:users))
    end

    create(index(:orders, [:user_id]))
  end
end
