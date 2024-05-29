defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size <= 0, do: []

  def slices(s, size) do
    substring_amount = String.length(s) - size

    if substring_amount >= 0 do
      for start <- 0..substring_amount do
        String.slice(s, start, size)
      end
    else
      []
    end
  end
end
