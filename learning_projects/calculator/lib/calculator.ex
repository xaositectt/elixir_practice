defmodule Calculator do
  def start do
    spawn(fn -> loop(0) end)
  end

  # private function
  defp loop(current_value) do
    # new_value becomes the return statement inside the receive
    # clauses
    new_value =
      receive do
        {:value, client_id} ->
          send(client_id, {:response, current_value})
          current_value

        {:add, value} ->
          current_value + value

        {:subtract, value} ->
          current_value - value

        {:multiply, value} ->
          current_value * value

        {:divide, value} ->
          div(current_value, value)

        invalid_request ->
          IO.puts("Invalid Request #{inspect(invalid_request)}")
          current_value
      end

    loop(new_value)
  end

  #we send the state of this function back to the client
  def value(server_id) do
    send(server_id, {:value, self()})
    receive do
      {:response, value} -> value
    end
  end

  #here I am defining the functions that send the main process
  #messages, and the replies are defined in the loop function
  #start with pid = Calculator.start to get the server_id
  def add(server_id, value) do
    send(server_id, {:add, value})
    value(server_id)
  end

  def subtract(server_id, value) do
    send(server_id, {:subtract, value})
    value(server_id)
  end

  def multiply(server_id, value) do
    send(server_id, {:multiply, value})
    value(server_id)
  end

  def divide(server_id, value) do
    send(server_id, {:divide, value})
    value(server_id)
  end
end
