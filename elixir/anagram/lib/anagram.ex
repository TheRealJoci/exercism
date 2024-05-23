defmodule Anagram do
  defp sort_string(string) do
    string
    |> String.graphemes()
    |> Enum.sort(:asc)
    |> List.to_string()
  end

  defp anagram?(base, candidate) do
    base = String.downcase(base)
    candidate = String.downcase(candidate)

    if base !== candidate && sort_string(base) === sort_string(candidate),
      do: true,
      else: false
  end

  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn candidate -> anagram?(base, candidate) end)
  end
end
