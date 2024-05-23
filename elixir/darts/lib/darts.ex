defmodule Darts do
  @type position :: {number, number}

  defp in_circle?({x, y}, radius) do
    Float.pow(x / 1, 2) + Float.pow(y / 1, 2) <= Float.pow(radius / 1, 2)
  end

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    %{
      1 => 10,
      5 => 5,
      10 => 1
    }
    |> Enum.find({nil, 0}, fn {radius, _} -> in_circle?({x, y}, radius) end)
    |> elem(1)
  end
end
