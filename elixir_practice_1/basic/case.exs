case 13 do
  1 -> IO.puts("it's one")
  "what" -> IO.puts("what is it")
  _ -> IO.puts("it's none of the options")
end

x = -10

case x do y
  when y > 0 -> IO.puts "Won't match"
  _ -> IO.puts "Will match"
end
