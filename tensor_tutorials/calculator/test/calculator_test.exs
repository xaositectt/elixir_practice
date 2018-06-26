defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  test "get initial value" do
    pid = Calculator.start()
    send(pid, {:value, self()})
    result = receive do
      {:response, value} -> value
    end
    assert result == 0
  end

  test "test add and value function" do
    pid = Calculator.start()
    send(pid, {:add, 10})
    send(pid, {:value, self()})
    result = receive do
      {:response, value} -> value
    end
    assert result == 10
  end

  test "test multiply and divide" do
    pid = Calculator.start()
    send(pid, {:add, 10})
    send(pid, {:mult, 15})
    send(pid, {:div, 50})
    send(pid, {:value, self()})
    result = receive do
      {:response, value} -> value
    end
    assert result == 3
  end

end
