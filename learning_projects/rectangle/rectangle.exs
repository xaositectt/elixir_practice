defmodule Rectangle do
  def loop do
    receive do
      {:area, a, b} ->
        IO.puts("The area is #{a * b}")
        loop()
      {:perimeter, a, b} ->
        IO.puts("The perimeter is #{2 * (a + b)}")
        loop()
      _ ->
        IO.puts("Wrong command")
        loop()
    end
  end
end
