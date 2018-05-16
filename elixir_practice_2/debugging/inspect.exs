1..10 |> IO.inspect(label: "before") |> Enum.map(fn x -> x*2 end) |> IO.inspect(label: "after") |> Enum.sum |> IO.inspect

defmodule Debugger do
  def something(a, b, c) do
    IO.inspect binding()
    a + b + c
  end
end

Debugger.something(1, 2, 3) |> IO.puts
