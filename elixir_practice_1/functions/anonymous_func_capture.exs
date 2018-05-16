announce = &(IO.puts "I would just like to say #{&1}, #{&2}")
announce.("hello", "peter")

square = &(IO.puts &1*&1)

square.(3)
