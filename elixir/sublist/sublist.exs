defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a === b, do: :equal
  def compare(a, b) do
    cond do
      sublist?(a,b) -> :sublist
      sublist?(b,a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: true
  defp sublist?(_, []), do: false
  defp sublist?(sublist, list) when length(sublist) > length(list), do: false
  defp sublist?(sublist, [_ | tail] = list) do
    if head?(sublist,list) do
      true
    else
      sublist?(sublist,tail)
    end
  end

  defp head?([],_), do: true
  defp head?([el | tail1], [el | tail2]) do
    head?(tail1,tail2)
  end
  defp head?(_,_), do: false

end
