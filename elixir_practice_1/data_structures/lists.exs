a = [1, 2, 3]

b = [2, 3]

IO.puts inspect(a -- b)
IO.puts inspect(a ++ b)

IO.puts hd(a)
IO.puts a |> tl |> inspect

IO.puts(hd(a))
IO.puts(tl(a)) #displays char shit

IO.puts Enum.at(a, 2)

IO.puts a |> Enum.at(2)



