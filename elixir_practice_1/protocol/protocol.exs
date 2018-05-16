defprotocol Size do
  @doc "Calculates the size of a data structure"
  def size(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end

defimpl Size, for: MapSet do
  def size(set), do: MapSet.size(set)
end

Size.size("Leila") |> IO.puts
Size.size(%{label: "some label"}) |> IO.puts
Size.size({"Leila", "Paige"}) |> IO.puts
Size.size(%{}) |> IO.puts

set = %MapSet{} = MapSet.new
set |> inspect |> IO.puts
Size.size(set) |> inspect |> IO.puts
