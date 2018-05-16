defmodule User do
  defstruct name: "Paige", age: 23
end

defmodule Main do
  def main do
    paige = %User{}
    IO.puts paige.name
    IO.puts paige.age
    leila = %{paige | name: "Leila", age: 26}
    IO.puts leila.name
    IO.puts leila.age
    IO.puts leila.__struct__
  end
end

Main.main
