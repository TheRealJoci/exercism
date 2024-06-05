defmodule PascalsTriangle do
  defp row(output \\ [1], previous)
  defp row(output, [first, second | tail]), do: [first + second | output] |> row([second | tail])
  defp row(output, _), do: [1 | output]

  defp do_rows(output \\ [[1, 1], [1]], index \\ 3, num)
  defp do_rows(output, index, num) when index - 1 === num, do: output

  defp do_rows([previous | _] = output, index, num) do
    [row(previous) | output] |> do_rows(index + 1, num)
  end

  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) when num < 1, do: :error
  def rows(1), do: [[1]]
  def rows(2), do: [[1], [1, 1]]
  def rows(num), do: do_rows(num) |> Enum.reverse()
end
