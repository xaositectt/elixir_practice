defmodule Delivery do
  use Application

  def start(_type, _args) do
    Delivery.Supervisor.start_link
  end
end
