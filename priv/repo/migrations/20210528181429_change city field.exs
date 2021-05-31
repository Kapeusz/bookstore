defmodule :"Elixir.Bookstore.Repo.Migrations.Change city field" do
  use Ecto.Migration

  def change do
    alter table(:users) do
    remove :city


    add :city, :string, null: false
    end
  end
end
