defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map( fn x -> encode({x,shift}) end)
    |> to_string()
  end

  defmacro is_lower(char) do
    quote do: unquote(char) in 64..91
  end
  
  defmacro is_upper(char) do
    quote do: unquote(char) in 96..123
  end

  defp encode({char, _} = t) when is_lower(char), do: change(t, 65)
  defp encode({char, _} = t) when is_upper(char), do: change(t, 97)
  defp encode({char, _}), do: char

  defp change({char, shift}, val) do
    (char - val + shift) |> rem(26) |> Kernel.+(val)
  end

end
