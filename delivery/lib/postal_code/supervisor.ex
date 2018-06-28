defmodule Delivery.PostalCode.Supervisor do
  use Supervisor
  alias Delivery.PostalCode.Store

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Store, [])
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
