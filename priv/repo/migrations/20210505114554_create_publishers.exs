defmodule Bookstore.Repo.Migrations.CreatePublishers do
  use Ecto.Migration

  def change do
    create table(:publishers) do
      add :name, :string
      add :email, :string

      timestamps()
    end

  end
end
