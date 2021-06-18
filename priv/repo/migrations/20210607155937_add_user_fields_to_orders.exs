defmodule Bookstore.Repo.Migrations.AddUserFieldsToOrders do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add(:user_id, references(:users))
      add(:email, :string)
      add(:first_name, :string)
      add(:last_name, :string)
      add(:address1, :string)
      add(:address2, :string)
      add(:address3, :string)
      add(:region, :string)
      add(:city, :string)
      add(:zip_code, :string)
    end
  end
end
