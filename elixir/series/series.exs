defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(string :: String.t(), size :: integer) :: list(String.t())
  def slices(string,size) do
    String.length(string) - size
    |> do_slices(string,size)
  end
  
  defp do_slices(_,_,size) when size <= 0, do: []
  defp do_slices(times,_,_) when times < 0, do: []
  defp do_slices(times,string,size) do
    (0..times) |> Enum.map(&String.slice(string,&1,size))
  end
    
end

