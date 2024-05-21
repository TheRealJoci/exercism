defmodule PaintByNumber do
  defp log2(number, result \\ 0)
  defp log2(number, result) when number <= 1, do: result
  defp log2(number, result), do: log2(number / 2, result + 1)

  def palette_bit_size(color_count) do
    log2(color_count)
  end

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) when picture === "" do
    <<pixel_color_index::size(log2(color_count))>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(log2(color_count)), picture::bitstring>>
  end

  def get_first_pixel(picture, _color_count) when picture === "", do: nil

  def get_first_pixel(picture, color_count) do
    fragment_size = log2(color_count)
    <<first::size(fragment_size), _rest::bitstring>> = picture
    first
  end

  def drop_first_pixel(picture, _color_count) when picture === <<>>, do: <<>>

  def drop_first_pixel(picture, color_count) do
    fragment_size = log2(color_count)
    <<_first::size(fragment_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
end
