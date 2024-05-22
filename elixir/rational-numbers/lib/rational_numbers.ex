defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @spec gcd(a :: integer, b :: integer) :: integer
  defp gcd(a, b) when b === 0, do: Kernel.abs(a)
  defp gcd(a, b), do: gcd(b, rem(a, b))

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}), do: {a1 * b2 + a2 * b1, b1 * b2} |> reduce()

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}), do: {a1 * b2 - a2 * b1, b1 * b2} |> reduce()

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}), do: {a1 * a2, b1 * b2} |> reduce()

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}), do: {a1 * b2, a2 * b1} |> reduce()

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}), do: {Kernel.abs(a), Kernel.abs(b)} |> reduce()

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(x :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) do
    if n !== Kernel.abs(n) do
      {Integer.pow(b, n * -1), Integer.pow(a, n * -1)} |> reduce()
    else
      {Integer.pow(a, n), Integer.pow(b, n)} |> reduce()
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {a, b} = reduce(n)
    Float.pow(x / 1, a / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) do
    gcd_ab = gcd(a, b)
    norm = if b === Kernel.abs(b), do: 1, else: -1
    {div(a * norm, gcd_ab), div(b * norm, gcd_ab)}
  end
end
