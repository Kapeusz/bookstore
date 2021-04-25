defmodule Bookstore.Repo.Migrations.RemovePublishedOnFromBooks do
  use Ecto.Migration

  def change do
    alter table("books") do
      remove(:published_on)
    end
  end
end
