x = fn
  x, y when y > 0 -> x + y
  x, y -> x * y
end

IO.puts x.(1, 2)
IO.puts x.(1, -2)
