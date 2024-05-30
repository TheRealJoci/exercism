defmodule Sublist do
  #   defp sublist?(ref_list, ref_sublist, tries, list \\ nil, sublist \\ nil)
  #   defp sublist?(list, sublist, tries, nil, nil), do: sublist?(list, sublist, tries, list, sublist)
  #   defp sublist?(ref, _, _, _list, []), do: true

  #   defp sublist?(ref_list, ref_sublist, tries, [head | list], [head | sublist]),
  #     do: sublist?(ref_list, ref_sublist, tries, list, sublist)

  #   defp sublist?(ref, _, 1, [head | _], [not_head | _]), do: false

  #   defp sublist?([_ | ref_list], ref_sublist, tries, _, _),
  #     do: sublist?(ref_list, ref_sublist, tries - 1)

  defp subseq?(_, []), do: true
  defp subseq?([head | list], [head | sublist]), do: subseq?(list, sublist)
  defp subseq?(_, _), do: false

  defp sublist?(list, sublist, tries \\ 1)
  defp sublist?(list, sublist, 1), do: subseq?(list, sublist)

  defp sublist?([_ | tail] = list, sublist, tries) do
    if not subseq?(list, sublist), do: sublist?(tail, sublist, tries - 1), else: true
  end

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    {len_a, len_b} = {length(a), length(b)}

    cond do
      len_a === len_b && sublist?(a, b) -> :equal
      len_a < len_b && sublist?(b, a, len_b - len_a + 1) -> :sublist
      len_a > len_b && sublist?(a, b, len_a - len_b + 1) -> :superlist
      true -> :unequal
    end
  end
end
