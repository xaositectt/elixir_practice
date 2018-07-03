defmodule Delivery.PostalCode.Navigatortest do
  use ExUnit.Case
  alias Delivery.PostalCode.Navigator
  doctest Delivery

  describe "get distance" do
    test "postal code strings" do
      distance = Navigator.get_distance("00637", "00670")

      assert is_float(distance)
    end

    test "postal code integers" do
      distance = Navigator.get_distance(00637, 00694)

      assert is_float(distance)
    end

    test "postal code integer and string" do
      distance = Navigator.get_distance("00637", 00694)

      assert is_float(distance)
    end

    #disables the logged error message
    @tag :capture_log
    test "postal code invalid format" do
      navigator_pid = Process.whereis(:postal_code_navigator)
      reference = Process.monitor(navigator_pid)
      catch_exit do
        Navigator.get_distance("94062", 94104.9876)
      end
      assert_received({:DOWN, ^reference, :process, ^navigator_pid, {%ArgumentError{}, _}})
    end
  end

  describe "get_distance (actual distance)" do
    test "distance_between_rwc_and_sf" do
      # Redwood City, CA 94062
      # San Francisco, CA 94104
      # Driving distance ~ 40 miles
      distance = Navigator.get_distance(94062, 94104)
      IO.puts "RWC -> SF: #{distance}"
      assert distance == 43.04
    end
    test "distance_between_sf_and_nyc" do
      # San Francisco, CA 94104
      # New York, NY 10112
      # Driving distance ~ 3100 miles
      distance = Navigator.get_distance(94104, 10112)
      IO.puts "SF -> NY: #{distance}"
      assert distance == 4128.16
    end
    test "distance_between_mnpls_and_austin" do
      # Minneapolis, MN 55401
      # Austin, TX 78703
      # Driving distance ~ 1100 miles
      distance = Navigator.get_distance(55401, 78703)
      IO.puts "MNPLS -> Austin: #{distance}"
      assert distance == 1680.18
    end
  end

end
