defmodule Delivery.PostalCode.Navigator do
  use GenServer
  alias :math, as: Math
  alias Delivery.PostalCode.{Store, Cache}

  #radius is 6371 km
  @radius 6371

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :postal_code_navigator)
  end

  def get_distance(from, to) do
    GenServer.call(:postal_code_navigator, {:get_distance, from, to})
  end

  def handle_call({:get_distance, from, to}, _from, state) do
    distance = do_get_distance(from, to)
    {:reply, distance, state}
  end


  #guards to check if they're strings
  defp do_get_distance(from, to) do
    from = format_postal_code(from)
    to = format_postal_code(to)

    distance = case Cache.get_distance(from, to) do
      nil ->
        {lat1, long1} = get_geolocation(from)
        {lat2, long2} = get_geolocation(to)
        distance = calculate_distance({lat1, long1}, {lat2, long2})
        Cache.set_distance(from, to, distance)
        distance
      distance -> distance
    end
    distance

  end

  defp get_geolocation(postal_code) do
    Store.get_geolocation(postal_code)
  end

  defp format_postal_code(postal_code) when is_binary(postal_code) do
    postal_code
  end

  defp format_postal_code(postal_code) when is_integer(postal_code) do
    postal_code = Integer.to_string(postal_code)
    postal_code = cond do
      String.length(postal_code) == 3 -> "00" <> postal_code
      String.length(postal_code) == 4 -> "0" <> postal_code
      true -> postal_code
    end
    postal_code
  end

  defp format_postal_code(postal_code) do
    error = "unexpected input, received: #{inspect(postal_code)}"
    raise ArgumentError, error
  end

  defp calculate_distance({lat1, long1}, {lat2, long2}) do
    lat_diff = degrees_to_radians(lat2 - lat1)
    long_diff = degrees_to_radians(long2 - long1)

    cos_lat1 = lat1 |> degrees_to_radians |> Math.cos
    cos_lat2 = lat2 |> degrees_to_radians |> Math.cos

    sin_lat_diff_sq = lat_diff/2 |> Math.sin |> Math.pow(2)
    sin_long_diff_sq = long_diff/2 |> Math.sin |> Math.pow(2)

    a = sin_lat_diff_sq + (cos_lat1 * cos_lat2 * sin_long_diff_sq)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    Float.round(@radius * c, 2)
  end

  defp degrees_to_radians(degrees) do
    degrees * (Math.pi /180)
  end
end
