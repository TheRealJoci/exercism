defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when not (a > 0 and b > 0 and c > 0),
    do: {:error, "all side lengths must be positive"}

  def kind(a, b, c) when not (a + b >= c and b + c >= a and a + c >= b),
    do: {:error, "side lengths violate triangle inequality"}

  def kind(a, b, c) when a === b and a === c, do: {:ok, :equilateral}
  def kind(a, b, c) when a === b or a === c or b === c, do: {:ok, :isosceles}
  def kind(_, _, _), do: {:ok, :scalene}
end
