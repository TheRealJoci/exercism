defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    for char <- String.to_charlist(text) do
      cond do
        char >= ?a and char <= ?z -> rem(char - ?a + shift, 26) + ?a
        char >= ?A and char <= ?Z -> rem(char - ?A + shift, 26) + ?A
        true -> char
      end
    end
    |> List.to_string()
  end
end
