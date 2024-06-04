defmodule FlattenArray do
  defp do_flatten(list, tail \\ [])
  defp do_flatten([], tail), do: tail
  defp do_flatten([hd | itl], tl) when hd == [] or hd === nil, do: do_flatten(itl, tl)
  defp do_flatten([hd | itl], tl) when is_list(hd), do: do_flatten(hd, do_flatten(itl, tl))
  defp do_flatten([hd | itl], tl), do: [hd | do_flatten(itl, tl)]

  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: do_flatten(list)
end
