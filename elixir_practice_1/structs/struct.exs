defmodule User do
  defstruct name: "John", age: 27
end

data = %{"name" => "Leila"}
user1 = struct(User, data)

user1 |> inspect |> IO.puts
user1.name |> IO.puts
user1.age |> IO.puts
