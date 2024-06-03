defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    for factor <- factors do
      if factor > 0 and limit > factor do
        factor..(limit - 1)//factor
        |> Enum.to_list()
        |> MapSet.new()
      else
        MapSet.new()
      end
    end
    |> Enum.filter(fn multiples -> MapSet.size(multiples) > 0 end)
    |> Enum.reduce(MapSet.new(), fn multiple, acc ->
      if MapSet.size(acc) === 0 do
        multiple
      else
        MapSet.union(acc, multiple)
      end
    end)
    |> Enum.sum()
  end
end
