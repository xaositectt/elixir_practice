announce = fn
  message
  when message == "welcome" ->
    IO.puts("hello there")

  message
  when message == "bye" ->
    IO.puts("bye")

  message ->
    IO.puts("hello there, #{message}")
end

announce.("friend")
