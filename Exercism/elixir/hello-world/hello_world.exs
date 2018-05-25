defmodule HelloWorld do
  @doc """
  Returns "Hello, World!" as a string, or greets the given name.
  """
  @spec hello :: String.t()
  def hello do
    "Hello, World!"
  end

  @spec hello(String.t()) :: String.t()
  def hello(name) do
    "Hello, #{name}"
  end
end
