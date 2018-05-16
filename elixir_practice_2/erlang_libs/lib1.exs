input = "hellö"
byte_size(input) |> IO.puts
String.length(input) |> IO.puts

symbol = "Ø"
String.to_charlist(symbol) |> inspect |> IO.puts

:binary.bin_to_list(symbol) |> inspect |> IO.puts

:io.format("Pi is:~10.6f~n", [:math.pi])

to_string :io_lib.format("Pi is:~10.6f~n", [:math.pi]) |> to_string() |> IO.puts()
