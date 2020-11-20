defmodule BookstoreWeb.Plugs.RoutesPlug do
  import Plug.Conn

  # make URLs case insensitive
  def init(opts) do
      opts
  end
  def call(conn, _params) do
    conn
    |> Map.put(:path_info, Enum.map(conn.path_info, &String.downcase(&1)))
    |> Map.put(:request_path, String.downcase(conn.request_path))
  end
end
