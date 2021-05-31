defmodule :"Elixir.Bookstore.Repo.Migrations.Add first and last name to users" do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_name, :string
      add :last_name, :string
  end
end
end
