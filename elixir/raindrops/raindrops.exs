defmodule Raindrops do
  @map %{3 => "Pling", 5 => "Plang", 7 => "Plong"}
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    @map
    |> Enum.filter(&factor(number,&1))
    |> Enum.map_join(&(elem(&1,1)))
    |> do_convert(number)
  end

  defp do_convert("",number), do: to_string(number)
  defp do_convert(string,_), do: string

  defp factor(number, {value,_}), do: rem(number,value) == 0
end