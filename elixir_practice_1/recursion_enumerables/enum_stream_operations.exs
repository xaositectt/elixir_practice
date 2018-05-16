odd? = &(rem(&1,2) != 0)

1..10 |> Enum.filter(odd?) |> inspect |> IO.puts

1..100000 |> Enum.map(fn x -> x*3 end) |> Enum.filter(odd?) |> Enum.sum() |> inspect()  |> IO.puts

1..10 |> Stream.filter(odd?) |> inspect |> IO.puts

1..10000 |> Stream.map(&(&1*3)) |> Stream.filter(odd?)  |> Enum.sum() |> IO.puts

infinite = Stream.cycle([1, 2, 3])

infinite |> Enum.take(10) |> inspect |> IO.puts

message = Stream.unfold("hello", &String.next_codepoint/1)

message |> Enum.take(3) |> inspect |> IO.puts
