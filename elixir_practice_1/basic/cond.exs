x = 3

cond do
  x == 1 -> IO.puts "it's one"
  x == 2 -> IO.puts "it's two"
  true -> IO.puts "not one or two"
end
