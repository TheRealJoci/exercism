defmodule EliudsEggs do
  defp do_egg_count(number, count \\ 0)
  defp do_egg_count(0, count), do: count
  defp do_egg_count(number, count), do: do_egg_count(div(number, 2), count + rem(number, 2))

  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number), do: do_egg_count(number)
end
