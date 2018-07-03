defmodule Delivery.PostalCode.CacheTest do
  use ExUnit.Case
  alias Delivery.PostalCode.Cache
  doctest Delivery

  test "get and set distance" do
    p1 = "12345"
    p2 = "98765"
    distance = 88.56

    Cache.set_distance(p1, p2, distance)

    retrieverd_distance = Cache.get_distance(p1, p2)

    assert distance == retrieverd_distance

  end


end
