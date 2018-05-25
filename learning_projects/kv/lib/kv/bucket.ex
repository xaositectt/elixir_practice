defmodule KV.Bucket do
  use Agent, restart: :temporary

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the bucket by key.
  """
  # bucket is the PID of the bucket we're using
  def get(bucket, key) do
    Agent.get(bucket, fn bucket -> Map.get(bucket, key) end)
  end

  @doc """
  Puts a value with a key in the bucket."
  """
  def put(bucket, key, value) do
    Agent.update(bucket, fn bucket -> Map.put(bucket, key, value) end)
  end

  @doc """
  Deletes and returns a value from the bucket."
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn bucket -> Map.pop(bucket, key) end)
  end
end
