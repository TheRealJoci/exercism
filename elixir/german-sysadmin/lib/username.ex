defmodule Username do
  # @german_chars %{?ä => [?a, ?e], ?ö => [?o, ?e], ?ü => [?u, ?e], ?ß => [?s, ?s]}

  defp letter_lowercase?(char), do: char >= ?a and char <= ?z

  defp underscore?(char), do: char === ?_

  # defp char_german_to_latin(char), do: Map.get(@german_chars, char, nil)
  defp char_german_to_latin(char) do
    case char do
      ?ä -> [?a, ?e]
      ?ö -> [?o, ?e]
      ?ü -> [?u, ?e]
      ?ß -> [?s, ?s]
      _ -> char
    end
  end

  def sanitize(username) do
    username
    |> Enum.map(fn char -> char_german_to_latin(char) || char end)
    |> List.flatten()
    |> Enum.filter(fn char -> letter_lowercase?(char) or underscore?(char) end)
  end
end
