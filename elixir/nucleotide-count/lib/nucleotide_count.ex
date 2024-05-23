defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]
  @nucleotide_freq_map Map.new(@nucleotides, fn nucleotide -> {nucleotide, 0} end)

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count(~c"AATAA", ?A)
  4

  iex> NucleotideCount.count(~c"AATAA", ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, match) do
    Enum.reduce(strand, 0, fn nucleotide, acc ->
      acc + if nucleotide === match, do: 1, else: 0
    end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram(~c"AATAA")
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    Enum.reduce(strand, @nucleotide_freq_map, fn nucleotide, freq_map ->
      Map.update!(freq_map, nucleotide, fn count -> count + 1 end)
    end)
  end
end
