defmodule Matrix do
  defstruct matrix: nil

  defp do_from_string(input, i \\ 0, j \\ 0, matrix \\ %{}, cell \\ "")

  defp do_from_string(<<part::utf8>> <> "\n" <> input, i, j, matrix, cell) do
    do_from_string(
      input,
      0,
      j + 1,
      Map.put(matrix, {j, i}, String.to_integer(<<cell::bitstring, part::utf8>>))
    )
  end

  defp do_from_string(<<part::utf8>> <> " " <> input, i, j, matrix, cell) do
    do_from_string(
      input,
      i + 1,
      j,
      Map.put(matrix, {j, i}, String.to_integer(<<cell::bitstring, part::utf8>>))
    )
  end

  defp do_from_string(<<part::utf8>> <> input, i, j, matrix, cell) do
    do_from_string(input, i, j, matrix, <<cell::bitstring, part::utf8>>)
  end

  defp do_from_string(_, i, j, matrix, cell) do
    Map.put(matrix, {j, i}, String.to_integer(cell))
  end

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input), do: do_from_string(input)

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix) do
    matrix
    |> rows()
    |> Enum.map(fn row -> Enum.join(row, " ") end)
    |> Enum.join("\n")
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix) do
    matrix
    |> Enum.group_by(fn {{j, _}, _} -> j end)
    |> Enum.sort_by(&{elem(&1, 0)})
    |> Enum.map(fn {_, row} ->
      row
      |> Enum.sort_by(&{elem(elem(&1, 0), 1)})
      |> Enum.map(fn {{_, _}, cell} -> cell end)
    end)
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index) do
    matrix
    |> Enum.filter(fn {{j, _}, _} -> index - 1 === j end)
    |> Enum.sort_by(&{elem(elem(&1, 0), 0)})
    |> Enum.map(fn {_, cell} -> cell end)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix) do
    matrix
    |> Enum.group_by(fn {{_, i}, _} -> i end)
    |> Enum.sort_by(&{elem(&1, 1)})
    |> Enum.map(fn {_, row} ->
      row
      |> Enum.sort_by(&{elem(elem(&1, 0), 0)})
      |> Enum.map(fn {{_, _}, cell} -> cell end)
    end)
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    matrix
    |> Enum.filter(fn {{_, i}, _} -> index - 1 === i end)
    |> Enum.sort_by(&{elem(elem(&1, 0), 0)})
    |> Enum.map(fn {_, cell} -> cell end)
  end
end
