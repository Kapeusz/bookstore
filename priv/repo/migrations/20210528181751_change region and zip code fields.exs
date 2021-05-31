defmodule :"Elixir.Bookstore.Repo.Migrations.Change region and zip code fields" do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :region
      remove :zip_code

      add :region, :string, null: false
      add :zip_code, :string, null: false
      end
  end
end
