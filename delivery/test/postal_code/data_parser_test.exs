defmodule Delivery.PostalCode.DataParserTest do
  use ExUnit.Case
  alias Delivery.PostalCode.DataParser
  doctest Delivery

  test "parse_data first row" do
    data_rows = DataParser.parse_data
    first_row = Enum.at(data_rows, 0)
    first_row |> IO.inspect

  end

  test "parse_data" do
    geolocation_data = DataParser.parse_data
    {latitude, longitude} = Map.get(geolocation_data, "98101")

    assert is_float(latitude)
    assert is_float(longitude)
  end

end
