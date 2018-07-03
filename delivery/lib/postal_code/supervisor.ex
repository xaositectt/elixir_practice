defmodule Delivery.PostalCode.Supervisor do
  use Supervisor
  alias Delivery.PostalCode.{Store, Navigator, Cache}

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Store, []),
      worker(Navigator, []),
      worker(Cache, []),
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
