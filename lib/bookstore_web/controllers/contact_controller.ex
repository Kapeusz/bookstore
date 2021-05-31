defmodule BookstoreWeb.ContactController do
  use BookstoreWeb, :controller

  alias Bookstore.{ContactMailer, Emails}

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, params) do
    params
    |> Emails.contact_email()
    |> ContactMailer.deliver_now()

    conn
    |> put_flash(:info, "Message sent")
    |> redirect(to: Routes.contact_path(conn, :index))
  end
end
