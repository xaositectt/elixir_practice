parent = self()

spawn(fn -> send(parent, {:hello, self()}) end)

response =
  receive do
    {:hello, pid} -> "received message from #{inspect(pid)}"
  end

response |> IO.puts

# result = receive do
#   {:hello, msg} -> msg
# after
#   1_000 -> "nothing after 1s"
#   #{:world, msg} -> msg
# end

# result |> inspect |> IO.puts
