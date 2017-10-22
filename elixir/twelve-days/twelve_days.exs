defmodule TwelveDays do
  
  @list [
    "twelve Drummers Drumming,",
    "eleven Pipers Piping,",
    "ten Lords-a-Leaping,",
    "nine Ladies Dancing,",
    "eight Maids-a-Milking,",
    "seven Swans-a-Swimming,",
    "six Geese-a-Laying,",
    "five Gold Rings,",
    "four Calling Birds,",
    "three French Hens,",
    "two Turtle Doves, and",
    "a Partridge in a Pear Tree."
    ]
  
  @numbers ~w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    "On the #{ordinal(number)} day of Christmas my true love gave to me, #{phrase(number)}"
  end

  defp ordinal(value), do: Enum.at(@numbers, value - 1)

  defp phrase(1), do: List.last(@list)

  defp phrase(number) do
    phrase = @list |> Enum.slice(-number..11) |> Enum.join(" ")
  end
  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse |> Enum.map_join("\n",&verse/1)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
    verses(1,12)
  end
end

