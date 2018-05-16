defmodule MyServer do
  @initial_state %{host: "127.0.0.1", port: 3456}
  def printMe do
    @initial_state |> inspect |> IO.puts
    @unknown
  end

end

MyServer.printMe
