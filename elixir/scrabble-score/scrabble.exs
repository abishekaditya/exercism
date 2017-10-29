defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase
    |> to_charlist()
    |> Enum.map(&value/1)
    |> Enum.sum
  end

  defp value(_), do: 0
  defp value(char) when char in ~c{AEIOULNRST}, do: 1
  defp value(char) when char in ~c{DG},         do: 2
  defp value(char) when char in ~c{BCMP},       do: 3
  defp value(char) when char in ~c{FHVWY},      do: 4
  defp value(char) when char in ~c{K},          do: 5
  defp value(char) when char in ~c{JX},         do: 8
  defp value(char) when char in ~c{QZ},         do: 10
end
