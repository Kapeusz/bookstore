defmodule Bookstore.Repo.Migrations.ConvertDescStringToText do
  use Ecto.Migration

  def change do
    alter table(:books) do
      modify :description, :text
    end
  end
end
