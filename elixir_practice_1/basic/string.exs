IO.puts "hello" <> " world"

a = "hello world"

IO.puts a |> String.codepoints |> inspect

a = "hellá"

IO.puts 'hello'

IO.puts a |> to_charlist
