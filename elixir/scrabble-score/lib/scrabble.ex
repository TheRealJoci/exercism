defmodule Scrabble do
  @letter_values %{
    1 => [?A, ?E, ?I, ?O, ?U, ?L, ?N, ?R, ?S, ?T],
    2 => [?D, ?G],
    3 => [?B, ?C, ?M, ?P],
    4 => [?F, ?H, ?V, ?W, ?Y],
    5 => [?K],
    8 => [?J, ?X],
    10 => [?Q, ?Z]
  }

  defp do_score(word, score \\ 0)
  defp do_score([], score), do: score

  defp do_score([char | rest], score) do
    @letter_values
    |> Enum.find({0, nil}, fn {_, chars} ->
      char in chars
    end)
    |> (&do_score(rest, score + elem(&1, 0))).()
  end

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.to_charlist()
    |> do_score()
  end
end
