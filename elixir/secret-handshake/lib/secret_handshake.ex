defmodule SecretHandshake do
  @secret_actions %{
                    0b00001 => "wink",
                    0b00010 => "double blink",
                    0b00100 => "close your eyes",
                    0b01000 => "jump"
                  }
                  |> Enum.sort(fn {ord1, _}, {ord2, _} ->
                    ord1 < ord2
                  end)

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
    @secret_actions
    |> Enum.reduce([], fn {bin, action}, acc ->
      if Bitwise.band(code, bin) !== 0, do: [action | acc], else: acc
    end)
    |> (&if(Bitwise.band(code, 0b10000) === 0, do: Enum.reverse(&1), else: &1)).()
  end
end
