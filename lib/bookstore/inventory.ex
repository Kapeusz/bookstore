defmodule Bookstore.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias Bookstore.Repo
  alias Bookstore.Genres
  alias Bookstore.Genres.Category
  alias Bookstore.Inventory.Book
  alias Bookstore.Media.Publisher
  alias BookstoreWeb.Views.ViewHelpers
  alias BookstoreWeb.Views

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  @book_sort_fields [
    "book__title",
    "book__original_price"
  ]
  def list_books(params) do
    search_term = get_in(params, ["query"])
    sort_params = get_in(params, ["order_by"])
    Book
    |> Bookstore.Inventory.Book.search(search_term)
    |> BookstoreWeb.ViewHelpers.sort_by_params(params, @book_sort_fields)
    |> preload(:category)
    |> preload(:author)
    |> preload(:publisher)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError

        def get_book!(slug) do
    Book
    |> Repo.get_by!(Book, slug: slug)
    |> Repo.preload(:category)
    |> Repo.preload(:author)
  end)

  """

  def get_book!(slug),
    do:
      Repo.get_by!(Book, slug: slug)
      |> Repo.preload(:category)
      |> Repo.preload(:author)
  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end

  def display_author_full_name do
    Book
    |> Book.get_author_full_name()
    |> Repo.all()
  end

  def get_category_books(name) do
    list_books(2)
    |> Enum.filter(fn book -> book.category.name == name end)
  end

  def newest_books do
    Book
    |> Book.recent_books()
    |> Repo.preload(:author)
    |> Repo.preload(:category)
  end
end
