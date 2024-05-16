defmodule NameBadge do
  def print(id, name, department) do
    id = if id, do: "[#{id}]", else: nil
    department = String.upcase(if department, do: department, else: "owner")

    [id, name, department]
    |> Enum.filter(fn exists? -> exists? end)
    |> Enum.join(" - ")
  end
end
