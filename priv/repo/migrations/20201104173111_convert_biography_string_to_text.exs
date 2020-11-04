defmodule Bookstore.Repo.Migrations.ConvertBiographyStringToText do
  use Ecto.Migration

  def change do
    alter table(:authors) do
      modify :biography, :text
    end
  end
end
