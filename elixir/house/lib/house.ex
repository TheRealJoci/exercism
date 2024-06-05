defmodule House do
  @start "This is the"
  @finish "that Jack built.\n"

  @lines {
    "house",
    "malt that lay in the",
    "rat that ate the",
    "cat that killed the",
    "dog that worried the",
    "cow with the crumpled horn that tossed the",
    "maiden all forlorn that milked the",
    "man all tattered and torn that kissed the",
    "priest all shaven and shorn that married the",
    "rooster that crowed in the morn that woke the",
    "farmer sowing his corn that kept the",
    "horse and the hound and the horn that belonged to the"
  }

  defp verse(output \\ @finish, index \\ 0, finish)
  defp verse(output, index, finish) when index > finish - 1, do: [@start, " " | output]

  defp verse(output, index, finish) when index <= finish - 1 do
    [elem(@lines, index), " " | output]
    |> verse(index + 1, finish)
  end

  @doc """
  Return verses of the nursery rhyme 'This is the House that Jack Built'.
  """
  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, stop) do
    for index <- start..stop do
      verse(index)
    end
    |> Enum.join("")
  end
end
