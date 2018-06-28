defmodule Delivery.PostalCode.Store do
  use GenServer
  alias Delivery.PostalCode.DataParser

  #passing an empty map is not necessary but good to show
  #what datatype we'll be using
  #by using a name we won't be able to use multiple processes
  #but we don't have to use the PID
  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :postal_code_store)
  end

  # the 2nd elem of the tuple is the state of the genserver
  #the DataParser module will be started every time we start the genserver
  def init(_) do
    geolocation_data = DataParser.parse_data
    {:ok, geolocation_data}
  end

  #we don't have to pass the process id because we have the name
  def get_geolocation(postal_code) do
    GenServer.call(:postal_code_store, {:get_geolocation, postal_code})
  end

  #Callbacks
  #handlecall return 2nd element is what the caller receives and 3rd element is the new state (same)
  def handle_call({:get_geolocation, postal_code}, _from, geolocation_data) do
    geolocation = Map.get(geolocation_data, postal_code)
    {:reply, geolocation, geolocation_data}
  end
end
