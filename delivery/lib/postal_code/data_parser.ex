defmodule Delivery.PostalCode.DataParser do
  @porstal_codes_filepath "data/2017_Gaz_zcta_national.txt"

  def parse_data do
    [_header | data_rows] = File.read!(@porstal_codes_filepath) |> String.split("\n")

    data_rows
    #same as &(String.split(&1, "\t"))
    |> Stream.map(fn row ->
      String.split(row, "\t") end)
    |> Stream.filter(&data_row_valid?/1)
    |> Stream.map(&get_useful_data/1)
    |> Enum.into(%{})
  end

  defp data_row_valid?(row) do
    length(row) == 7
  end

  #function that returns a 3 element tuple from the txt file row with the zip code and coordinates
  defp get_useful_data(row) do
    [postal_code, _, _, _, _, latitude, longitude] = row
    format_row([postal_code, latitude, longitude])
  end

  #function that transforms data and format
  defp format_row([postal_code, latitude, longitude]) do
    postal_code = String.trim(postal_code)
    latitude = parse_to_float(latitude)
    longitude = parse_to_float(longitude)
    {postal_code, {latitude, longitude}}
  end

  defp parse_to_float(string) do
    string |> Float.parse |> elem(0)
  end
end
