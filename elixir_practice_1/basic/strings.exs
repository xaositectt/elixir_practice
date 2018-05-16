IO.puts "hello world"
IO.puts "hello\nworld"

IO.puts is_binary "hello"
IO.puts is_binary "hello\nworld"
IO.puts is_bitstring "hello\nworld"

#byte size

IO.puts byte_size "hello world"

#ö is 2 bytes
IO.puts byte_size("hello wörld")
IO.puts String.length("hello wörld")

IO.puts String.capitalize("hello world")
IO.puts String.upcase("hello world")
IO.puts String.downcase("HELLO world")


