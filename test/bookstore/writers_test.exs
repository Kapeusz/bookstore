defmodule Bookstore.WritersTest do
  use Bookstore.DataCase

  alias Bookstore.Writers

  describe "authors" do
    alias Bookstore.Writers.Author

    @valid_attrs %{biography: "some biography", first_name: "some first_name", last_name: "some last_name"}
    @update_attrs %{biography: "some updated biography", first_name: "some updated first_name", last_name: "some updated last_name"}
    @invalid_attrs %{biography: nil, first_name: nil, last_name: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Writers.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Writers.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Writers.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = Writers.create_author(@valid_attrs)
      assert author.biography == "some biography"
      assert author.first_name == "some first_name"
      assert author.last_name == "some last_name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Writers.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, %Author{} = author} = Writers.update_author(author, @update_attrs)
      assert author.biography == "some updated biography"
      assert author.first_name == "some updated first_name"
      assert author.last_name == "some updated last_name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Writers.update_author(author, @invalid_attrs)
      assert author == Writers.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Writers.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Writers.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Writers.change_author(author)
    end
  end
end
