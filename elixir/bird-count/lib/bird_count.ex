defmodule BirdCount do
  def today([]), do: nil
  def today([head | _]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  # def has_day_without_birds?(list) do
  #   list
  #   |> Enum.map(fn day -> day === 0 end)
  #   |> Enum.any?()
  # end

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([head | tail]) do
    if(head === 0, do: true, else: has_day_without_birds?(tail))
  end

  # def total(list) do
  #   Enum.reduce(list, 0, fn day, count -> day + count end)
  # end

  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  # def busy_days(list) do
  #   list
  #   |> Enum.filter(fn day -> day >= 5 end)
  #   |> length()
  # end

  def busy_days([]), do: 0

  def busy_days([head | tail]) do
    busy_day? = if head >= 5, do: 1, else: 0
    busy_day? + busy_days(tail)
  end
end
