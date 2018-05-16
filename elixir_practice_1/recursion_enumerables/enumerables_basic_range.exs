list = [1, 2, 3, 4]

list |> Enum.map(fn x -> x * 2 end) |> inspect |> IO.puts()
list |> Enum.map(fn x -> IO.puts(x * 2) end)

1..5 |> Enum.reduce(0, fn x, y -> x + y end) |> IO.puts

Enum.map(1..3, fn x -> IO.puts(x * 2) end)
