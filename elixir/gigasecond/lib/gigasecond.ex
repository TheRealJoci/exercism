defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from({{year, month, day}, {hours, minutes, seconds}}) do
    future =
      DateTime.new!(Date.new!(year, month, day), Time.new!(hours, minutes, seconds))
      |> DateTime.add(10 ** 9)

    {{future.year, future.month, future.day}, {future.hour, future.minute, future.second}}
  end
end
