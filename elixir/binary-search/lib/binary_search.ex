defmodule BinarySearch do
  defp do_search(numbers, target, lower, upper)

  defp do_search(numbers, target, lower, upper)
       when elem(numbers, div(upper + lower, 2)) === target do
    {:ok, div(upper + lower, 2)}
  end

  defp do_search(numbers, target, lower, upper)
       when elem(numbers, div(upper + lower, 2) + 1) === target do
    {:ok, div(upper + lower, 2) + 1}
  end

  defp do_search(_, _, lower, upper)
       when lower === upper or lower === upper - 1 do
    :not_found
  end

  defp do_search(numbers, target, lower, upper)
       when elem(numbers, div(upper + lower, 2)) > target do
    do_search(numbers, target, lower, div(upper + lower, 2))
  end

  defp do_search(numbers, target, lower, upper)
       when elem(numbers, div(upper + lower, 2)) < target do
    do_search(numbers, target, div(upper + lower, 2), upper)
  end

  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found
  def search(numbers, key), do: do_search(numbers, key, 0, tuple_size(numbers) - 1)
end
