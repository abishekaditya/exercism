defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    list_of_words(sentence)
    |> Enum.reduce(%{}, &map_update/2)
    |> Map.delete("")
  end

  defp list_of_words(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/[.!&_@$%^,:]/, " ")
    |> String.split(" ")

  end

  defp map_update(word, dict) do
    Map.update(dict, word, 1, &(&1 + 1))
  end
end
