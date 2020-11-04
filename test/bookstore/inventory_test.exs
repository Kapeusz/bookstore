defmodule Bookstore.InventoryTest do
  use Bookstore.DataCase

  alias Bookstore.Inventory

  describe "books" do
    alias Bookstore.Inventory.Book

    @valid_attrs %{author_id: 42, category_id: 42, description: "some description", image_url: "some image_url", isbn: "some isbn", original_price: 120.5, published_on: ~D[2010-04-17], title: "some title"}
    @update_attrs %{author_id: 43, category_id: 43, description: "some updated description", image_url: "some updated image_url", isbn: "some updated isbn", original_price: 456.7, published_on: ~D[2011-05-18], title: "some updated title"}
    @invalid_attrs %{author_id: nil, category_id: nil, description: nil, image_url: nil, isbn: nil, original_price: nil, published_on: nil, title: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Inventory.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Inventory.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Inventory.create_book(@valid_attrs)
      assert book.author_id == 42
      assert book.category_id == 42
      assert book.description == "some description"
      assert book.image_url == "some image_url"
      assert book.isbn == "some isbn"
      assert book.original_price == 120.5
      assert book.published_on == ~D[2010-04-17]
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Inventory.update_book(book, @update_attrs)
      assert book.author_id == 43
      assert book.category_id == 43
      assert book.description == "some updated description"
      assert book.image_url == "some updated image_url"
      assert book.isbn == "some updated isbn"
      assert book.original_price == 456.7
      assert book.published_on == ~D[2011-05-18]
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_book(book, @invalid_attrs)
      assert book == Inventory.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Inventory.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Inventory.change_book(book)
    end
  end
end
