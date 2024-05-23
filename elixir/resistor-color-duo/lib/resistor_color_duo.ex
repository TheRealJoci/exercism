defmodule ResistorColorDuo do
  @color_to_digit %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([first | [second | _]]) do
    10 * @color_to_digit[first] + @color_to_digit[second]
  end
end
