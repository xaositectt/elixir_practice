defmodule Chat.Server do
  use GenServer

  #Genserver is an abstraction with a set of functions
  #it allows to create detached processes that can use modules
  #GenServer enables the whole message sending thing

  #client side
  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def get_msgs(pid) do
    GenServer.call(pid, :get_msgs)
  end

  def add_msg(pid, msg) do
    GenServer.cast(pid, {:add_msg, msg})
  end

  #server side / callback functions

  def init(msgs) do
    {:ok, msgs}
  end

  def handle_call(:get_msgs, _form, msgs) do
    {:reply, msgs, msgs}
  end

  def handle_cast({:add_msg, msg}, msgs) do
    {:noreply, [msg | msgs]}
  end


end
