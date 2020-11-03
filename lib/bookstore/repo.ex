defmodule Bookstore.Repo do
  use Ecto.Repo,
    otp_app: :bookstore,
    adapter: Ecto.Adapters.Postgres
end
