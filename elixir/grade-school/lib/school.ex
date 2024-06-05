defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type school :: any()

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  def new(), do: %{}

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add(school, name, grade) do
    if school |> Map.get(name) !== nil do
      {:error, school}
    else
      {:ok, Map.put(school, name, grade)}
    end
  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    school
    |> Enum.reduce([], fn {name, grade?}, class ->
      if grade? === grade, do: [name | class], else: class
    end)
    |> Enum.sort(:asc)
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    school
    |> Enum.sort_by(&{elem(&1, 1), elem(&1, 0)})
    |> Enum.map(fn {name, _} -> name end)
  end
end
