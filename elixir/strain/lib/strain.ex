defmodule Strain do
  @spec do_keep(list :: list(any), fun :: (any -> boolean), output :: list(any)) :: list(any)
  defp do_keep([], _fun, output), do: output

  defp do_keep([head | tail], fun, output) do
    if fun.(head) do
      do_keep(tail, fun, output ++ [head])
    else
      do_keep(tail, fun, output)
    end
  end

  @spec do_discard(list :: list(any), fun :: (any -> boolean), output :: list(any)) :: list(any)
  defp do_discard([], _fun, output), do: output

  defp do_discard([head | tail], fun, output) do
    if !fun.(head) do
      do_discard(tail, fun, output ++ [head])
    else
      do_discard(tail, fun, output)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: do_keep(list, fun, [])

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: do_discard(list, fun, [])
end
