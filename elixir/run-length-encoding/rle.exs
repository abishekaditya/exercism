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
    Regex.scan(~r/(([\w ])\2*)/, string)
    |> Enum.map(&List.first/1)
    |> Enum.map_join(&contract(&1,String.length(&1)))
  end

  defp contract(str,1), do: str
  defp contract(str,_) do
    str
    |> String.length
    |> to_string
    |> Kernel.<>(String.first(str))
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/([0-9]*[A-Za-z ])/, string)
    |> Enum.map(&List.first/1)
    |> Enum.map_join(&expander/1)
  end

  defp expander(str) do
    cond do
      String.length(str) == 1 -> str
      true -> expand(str)
    end
  end

  defp expand(str) do
    char = String.last(str)
    number = String.slice(str,0,String.length(str) - 1)
    String.duplicate(char,to_int(number))
  end

  defp to_int(""), do: ""
  defp to_int(str), do: String.to_integer(str)
end
