"leila" |> (fn message -> IO.puts "hello, #{message}"  end).()

"paige" |> (&(IO.puts "hello, #{&1}")).()
