defmodule Bob do
  def hey(input) do
    case check(input) do
        :shouting -> "Whoa, chill out!"
        :question -> "Sure."
        :silence -> "Fine. Be that way!"
        _ -> "Whatever."

    end
  end

  defp check(input) do
    cond do
      String.ends_with?(input,"?") -> :question
      String.trim(input) == "" -> :silence
      shouting?(input) -> :shouting
      true -> :default
    end
  end

  defp shouting?(input) do
     String.upcase(input) == input && String.downcase(input) != input
  end
end
