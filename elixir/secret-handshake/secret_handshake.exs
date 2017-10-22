use Bitwise
defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    [0b1, 0b10, 0b100, 0b1000, 0b10000]
    |> Enum.reduce([], &check(code,&1,&2))
    |> Enum.reverse()
  end

  defp check(code, num, list) do
    if (code &&& num) === num do
      case num do
        1  -> [ "wink" | list ]
        2  -> [ "double blink" | list ]
        4  -> [ "close your eyes" | list ]
        8  -> [ "jump" | list ]
        16 -> Enum.reverse(list)
      end
    else
      list
    end
  end
end

