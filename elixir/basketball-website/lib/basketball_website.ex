defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    path
    |> String.split(".")
    |> Enum.reduce(data, fn accessor, data -> data[accessor] end)
  end

  def get_in_path(data, path), do: Kernel.get_in(data, String.split(path, "."))
end
