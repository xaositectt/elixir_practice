defmodule Math do
  def sum(a, b) do
    a + b
  end

  defp psum(a, b) do
    a+b
  end
end

IO.puts 1 |> Math.sum(2)

IO.puts 1  |> Math.psum(2)
