defmodule Bookstore.Repo.Migrations.RemoveBiographyFromAuthors do
  use Ecto.Migration

  def change do
    alter table("authors") do
      remove(:biography)
    end
  end
end
