defmodule Bookstore.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :string, null: false)
      add(:password_hash, :string)
      add(:address_1, :string, null: false)
      add(:address_2, :string, default: nil)
      add(:address_3, :string, default: nil)
      add(:city, :string, null: false)
      add(:region, :string, null: false)
      add(:zip_code, :string, null: false)
      add(:role, :string, null: false, default: "customer")
      timestamps()
    end

    create(unique_index(:users, [:email]))
  end
end
