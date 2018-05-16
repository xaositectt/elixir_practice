flatten = &List.flatten/2

[1, [[2], 3]] |> flatten.([4, 5]) |> inspect |> IO.puts()

flatten.([1, [[2], 3]], [4, 5]) |> inspect |> IO.puts()
