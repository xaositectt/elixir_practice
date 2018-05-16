defmodule Math do
  def isZero?(0) do
    true
  end

  def isZero?(x) when is_integer(x) do
    false
  end
end

IO.puts 1 |> Math.isZero?
IO.puts 0 |> Math.isZero?
# IO.puts 0.0 |> Math.isZero? #returns functionclause error

fun = &Math.isZero?/1

IO.puts fun |> is_function()

IO.puts 10 |> fun.()

IO.puts (&is_function/1).(fun)


