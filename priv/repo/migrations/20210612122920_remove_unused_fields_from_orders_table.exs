defmodule Bookstore.Repo.Migrations.RemoveUnusedFieldsFromOrdersTable do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      remove(:region)
      remove(:zip_code)
      remove(:address1)
      remove(:address2)
      remove(:address3)
      remove(:first_name)
      remove(:last_name)
      remove(:city)
    end
  end
end
