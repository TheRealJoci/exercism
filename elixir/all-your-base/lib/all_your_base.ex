defmodule AllYourBase do
  defp dec_to(number, base, output \\ [])
  defp dec_to(0, _, []), do: [0]
  defp dec_to(0, _, output), do: output

  defp dec_to(number, base, output) do
    dec_to(div(number, base), base, [rem(number, base)] ++ output)
  end

  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, in_base, _out_base) when in_base < 2, do: {:error, "input base must be >= 2"}
  def convert(_, _in_base, out_base) when out_base < 2, do: {:error, "output base must be >= 2"}
  def convert([], _in_base, _out_base), do: {:ok, [0]}

  def convert(digits, in_base, out_base) do
    if Enum.any?(digits, fn digit -> not (digit >= 0 and digit < in_base) end) do
      {:error, "all digits must be >= 0 and < input base"}
    else
      {:ok,
       digits
       |> Enum.zip((length(digits) - 1)..0)
       |> Enum.reduce(0, fn {digit, index}, acc -> acc + digit * Integer.pow(in_base, index) end)
       |> dec_to(out_base)}
    end
  end
end
