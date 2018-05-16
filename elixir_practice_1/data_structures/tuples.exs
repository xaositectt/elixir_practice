a = {"true", true, :atom}

IO.puts a |> inspect

IO.puts elem(a, 1)

IO.puts a |> put_elem(1, false) |>inspect

IO.puts a |> tuple_size

