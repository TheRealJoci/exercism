defmodule CollatzConjecture do
  defp do_calc(input, output \\ 0)
  defp do_calc(1, output), do: output

  defp do_calc(input, output) when is_integer(input) and input > 0 do
    input = if rem(input, 2) === 0, do: div(input, 2), else: input * 3 + 1
    do_calc(input, output + 1)
  end

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input), do: do_calc(input)
end
