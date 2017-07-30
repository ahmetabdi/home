defmodule HomeWeb.PageController do
  use HomeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
