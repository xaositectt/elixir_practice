defmodule PlugServer.Router do
  use Plug.Router

  plug :match
  plug :dispatch
  #plug to specify that we get a static file from the server
  plug Plug.Static, at: "/home", from: :server

  #plug cases- as if it were pattern matching
  get "/" do
    send_resp(conn, 200, "Hello World")
  end

  get "/about/:user_name" do
    send_resp(conn, 200, "Hello, #{user_name}")
  end

  get "/home" do
    #define the type of conn
    conn = put_resp_content_type(conn, "text/html")
    send_file(conn, 200, "lib/index.html")
  end

  match _, do: send_resp(conn, 404, "404 error not found!")
end
