defmodule KitchenCalculator do
  def get_volume({_, volume} = _volume_pair), do: volume

  def to_milliliter({:milliliter, volume} = _volume_pair), do: {:milliliter, volume}
  def to_milliliter({:cup, volume} = _volume_pair), do: {:milliliter, volume * 240}
  def to_milliliter({:fluid_ounce, volume} = _volume_pair), do: {:milliliter, volume * 30}
  def to_milliliter({:teaspoon, volume} = _volume_pair), do: {:milliliter, volume * 5}
  def to_milliliter({:tablespoon, volume} = _volume_pair), do: {:milliliter, volume * 15}

  def from_milliliter({_, volume} = _volume_pair, :milliliter = unit), do: {unit, volume}
  def from_milliliter({_, volume} = _volume_pair, :cup = unit), do: {unit, volume / 240}
  def from_milliliter({_, volume} = _volume_pair, :fluid_ounce = unit), do: {unit, volume / 30}
  def from_milliliter({_, volume} = _volume_pair, :teaspoon = unit), do: {unit, volume / 5}
  def from_milliliter({_, volume} = _volume_pair, :tablespoon = unit), do: {unit, volume / 15}

  def convert(volume_pair, unit_target) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit_target)
  end
end
