defmodule :"Elixir.Bookstore.Repo.Migrations.Change address fields" do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :address_1
      remove :address_2
      remove :address_3

      add :address1, :string, null: false
      add :address2, :string, default: nil
      add :address3, :string, default: nil
    end
  end
end
