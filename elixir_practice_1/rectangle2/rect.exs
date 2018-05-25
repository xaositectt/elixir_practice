defmodule Rectangle do
  def loop do
    receive do
      {:area, x, y} ->
        # x * y
        20 |> IO.puts
        loop()

      {:perimeter, x, y} ->
        # result = 2 * x + 2 * y
        20 |> IO.puts
        loop()
    end
  end
end
