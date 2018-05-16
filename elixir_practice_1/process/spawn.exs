pid = spawn(fn  -> 1+2 end)

Process.alive?(pid) |> IO.puts

self() |> inspect |> IO.puts

Process.alive?(self()) |> IO.puts

send self(), {:hello, "world"}
send self(), {:world, "hello"}

hello = receive do
  {:hello, msg} -> msg
after
  1_000 -> IO.puts "nothing after 1s"
  #{:world, msg} -> msg
end

world = receive do
  #{:hello, msg} -> msg
  {:world, msg} -> msg
end

world |> IO.puts
hello |> IO.puts
