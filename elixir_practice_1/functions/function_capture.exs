defmodule Math do
  def isZero?(0) do
    true
  end

  def isZero?(x) when is_integer(x) do
    false
  end
end

captured = &Math.isZero?/1

IO.puts captured.(0)

IO.puts (&is_function/1).(captured)

fun = &(&1 + 1)

IO.puts fun.(10) #returns 11
