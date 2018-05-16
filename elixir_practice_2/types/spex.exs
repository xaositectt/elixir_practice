defmodule Fix do
  @spec fix(String.t()) :: {String.t()}
  def fix(input) do
    input
  end
end

defmodule Calculator do
  @typedoc """
  A number followed by a string
  """

  @type number_with_remark :: {number, String.t()}

  @spec add(number, number) :: number_with_remark
  def add(x, y), do: {x + y, "You need a calculator for that?"}
end

Fix.fix('what') |> IO.puts()
Calculator.add(1, 2) |> inspect |> IO.puts()
