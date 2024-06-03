defmodule BottleSong do
  @number_to_word %{
    0 => "no",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten"
  }

  defp bottles?(index) do
    if index === 1, do: "bottle", else: "bottles"
  end

  defp verse(index) do
    """
    #{String.capitalize(@number_to_word[index])} green #{bottles?(index)} hanging on the wall,
    #{String.capitalize(@number_to_word[index])} green #{bottles?(index)} hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be #{@number_to_word[index - 1]} green #{bottles?(index - 1)} hanging on the wall.\
    """
  end

  @moduledoc """
  Handles lyrics of the popular children song: Ten Green Bottles
  """

  @spec recite(pos_integer, pos_integer) :: String.t()
  def recite(start, amount) do
    for index <- start..(start - amount + 1) do
      verse(index)
    end
    |> Enum.join("\n\n")
  end
end
