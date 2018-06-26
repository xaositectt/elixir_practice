defmodule Rectangle do
  def loop do
    receive do
      {:area, w, h} ->
      IO.puts "Area = #{w*h}"
      loop()
      {:perimeter, w, h} ->
      IO.puts "Perimeter = #{2*w*h}"
      loop()
    end
  end
end

