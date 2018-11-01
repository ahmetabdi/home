defmodule Home.Router do
  use Plug.Router

  plug Plug.Static, at: "/", from: "lib/web"
  plug :match
  plug :dispatch

  def parse(conn, opts \\ []) do
    opts = Keyword.put_new(opts, :parsers, [Plug.Parsers.URLENCODED, Plug.Parsers.MULTIPART])
    Plug.Parsers.call(conn, Plug.Parsers.init(opts))
  end

  get "/" do
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> Plug.Conn.send_file(200, "lib/web/index.html")
  end

  get "/blog" do
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> Plug.Conn.send_file(200, "lib/web/blog.html")
  end

  post "/contact_us" do
    conn = parse(conn)

    Home.Emails.contact_email(
      conn.params["name"],
      conn.params["email"],
      conn.params["message"],
      conn.params["phone"]
    )

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "OK")
  end

  match _ do
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> Plug.Conn.send_file(404, "lib/web/404.html")
  end
end
