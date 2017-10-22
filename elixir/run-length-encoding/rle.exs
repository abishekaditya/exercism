defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(~r/(([\w ])\2*)/,string)
    |> Enum.map(&String.first/1)
    |> Enum.map_join(&contract(&1,String.length(&1)))
  end

  defp contract(str,1), do: str
  defp contract(str,num) do
    str
    |> String.length
    |> to_string
    |> Kernel.<>(String.first(str))
  end

  @spec decode(String.t) :: String.t
  def decode(string) do

  end
end
