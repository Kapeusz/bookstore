defmodule BookstoreWeb.PublisherControllerTest do
  use BookstoreWeb.ConnCase

  alias Bookstore.Media

  @create_attrs %{email: "some email", name: "some name"}
  @update_attrs %{email: "some updated email", name: "some updated name"}
  @invalid_attrs %{email: nil, name: nil}

  def fixture(:publisher) do
    {:ok, publisher} = Media.create_publisher(@create_attrs)
    publisher
  end

  describe "index" do
    test "lists all publishers", %{conn: conn} do
      conn = get(conn, Routes.publisher_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Publishers"
    end
  end

  describe "new publisher" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.publisher_path(conn, :new))
      assert html_response(conn, 200) =~ "New Publisher"
    end
  end

  describe "create publisher" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.publisher_path(conn, :create), publisher: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.publisher_path(conn, :show, id)

      conn = get(conn, Routes.publisher_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Publisher"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.publisher_path(conn, :create), publisher: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Publisher"
    end
  end

  describe "edit publisher" do
    setup [:create_publisher]

    test "renders form for editing chosen publisher", %{conn: conn, publisher: publisher} do
      conn = get(conn, Routes.publisher_path(conn, :edit, publisher))
      assert html_response(conn, 200) =~ "Edit Publisher"
    end
  end

  describe "update publisher" do
    setup [:create_publisher]

    test "redirects when data is valid", %{conn: conn, publisher: publisher} do
      conn = put(conn, Routes.publisher_path(conn, :update, publisher), publisher: @update_attrs)
      assert redirected_to(conn) == Routes.publisher_path(conn, :show, publisher)

      conn = get(conn, Routes.publisher_path(conn, :show, publisher))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, publisher: publisher} do
      conn = put(conn, Routes.publisher_path(conn, :update, publisher), publisher: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Publisher"
    end
  end

  describe "delete publisher" do
    setup [:create_publisher]

    test "deletes chosen publisher", %{conn: conn, publisher: publisher} do
      conn = delete(conn, Routes.publisher_path(conn, :delete, publisher))
      assert redirected_to(conn) == Routes.publisher_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.publisher_path(conn, :show, publisher))
      end
    end
  end

  defp create_publisher(_) do
    publisher = fixture(:publisher)
    %{publisher: publisher}
  end
end
