defmodule RomanNumerals do
  @arabic_to_roman %{
                     1000 => "M",
                     900 => "CM",
                     500 => "D",
                     400 => "CD",
                     100 => "C",
                     90 => "XC",
                     50 => "L",
                     40 => "XL",
                     10 => "X",
                     9 => "IX",
                     5 => "V",
                     4 => "IV",
                     1 => "I"
                   }
                   |> Enum.sort(fn {arabic1, _}, {arabic2, _} -> arabic1 > arabic2 end)

  defp do_numeral(number, output \\ "")
  defp do_numeral(0, output), do: output

  defp do_numeral(number, output) do
    @arabic_to_roman
    |> Enum.find(fn {arabic, _} -> number >= arabic end)
    |> (&do_numeral(number - elem(&1, 0), output <> elem(&1, 1))).()
  end

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: do_numeral(number)
end
