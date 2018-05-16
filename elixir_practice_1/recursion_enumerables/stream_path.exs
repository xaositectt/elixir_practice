stream = File.stream!("C:/Users/Acer/xaositectt/very_creatives/elixir.odt")

stream |> Enum.take(10) |> inspect |> IO.puts
