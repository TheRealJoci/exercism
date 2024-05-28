defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    # MapSet.subset?(
    #   MapSet.new(?a..?z),
    #   sentence
    #   |> String.downcase()
    #   |> String.to_charlist()
    #   |> MapSet.new()
    # )

    sentence
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.reduce_while({false, MapSet.new()}, fn char, {_pangram?, alphabet} ->
      alphabet = if char >= ?a and char <= ?z, do: MapSet.put(alphabet, char), else: alphabet
      pangram? = if MapSet.size(alphabet) === 26, do: true, else: false
      {if(pangram?, do: :halt, else: :cont), {pangram?, alphabet}}
    end)
    |> elem(0)
  end
end
