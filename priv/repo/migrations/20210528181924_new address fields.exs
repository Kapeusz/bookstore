defmodule :"Elixir.Bookstore.Repo.Migrations.New address fields" do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :address1
      remove :address2
      remove :address3
      remove :region
      remove :city
      remove :zip_code

      add :address1, :string
      add :address2, :string, default: nil
      add :address3, :string, default: nil
      add :region, :string
      add :city, :string
      add :zip_code, :string
    end
  end
end
