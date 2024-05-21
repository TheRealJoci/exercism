defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0
      ?A -> 1
      ?C -> 2
      ?G -> 4
      ?T -> 8
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0 -> ?\s
      1 -> ?A
      2 -> ?C
      4 -> ?G
      8 -> ?T
    end
  end

  defp do_encode(~c"", output), do: output

  defp do_encode([head | tail], output) do
    encoding = encode_nucleotide(head)
    do_encode(tail, <<output::bitstring, encoding::4>>)
  end

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_decode(<<>>, output), do: output

  defp do_decode(<<head::4, rest::bitstring>>, output) do
    do_decode(rest, output ++ [decode_nucleotide(head)])
  end

  def decode(dna), do: do_decode(dna, [])
end
