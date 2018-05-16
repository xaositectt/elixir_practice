defmodule Printer do
  @callback print(String.t) :: {:ok, String.t} | {:error, String.t}
  @callback log() :: String.t
end
