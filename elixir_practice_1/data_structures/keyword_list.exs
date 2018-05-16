list = [{:a, 1},{:b, 2}]

IO.puts list |> Enum.at(0) |> inspect

IO.puts list ++ [c: 3] |> inspect
IO.puts list[:a]

