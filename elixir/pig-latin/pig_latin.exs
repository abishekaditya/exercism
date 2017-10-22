defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.split(phrase)
    |> Enum.map(fn(w) -> process_word(w) end)
    |> Enum.join(" ")
  end

  defp process_word(word) do
    first_letter_is_vowel?(word)
    |> translate_word(word)
  end

  defp first_letter_is_vowel?(string) when is_binary(string) do
    vowels = ~w(a e i o u xr yt)
    String.starts_with?(string, vowels)
  end

  defp first_letter_is_vowel?(_) do
    false
  end

  defp translate_word(true, word) do
    word <> "ay"
  end

  defp translate_word(_, word) do
    spec = ~r{^(ch|qu|squ|thr|th|sch)}
    char = ~r{^([b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z]+)}
    parts = cond do
    special_consonant_case?(word) ->
      String.split(word, spec, include_captures: true, trim: true)
    true ->
      String.split(word, char, include_captures: true, trim: true)
    end
    List.last(parts) <> List.first(parts) <> "ay"
  end

  defp special_consonant_case?(word) do
    String.starts_with?(word, ["ch", "qu", "squ", "th", "thr", "sch"])
  end
end