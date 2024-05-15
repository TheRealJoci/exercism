defmodule LanguageList do
  def new() do
    # Please implement the new/0 function
    []
  end

  def add(list, language) do
    # Please implement the add/2 function
    list |> List.insert_at(0, language)
  end

  def remove(list) do
    # Please implement the remove/1 function
    list |> List.delete_at(0)
  end

  def first(list) do
    # Please implement the first/1 function
    List.first(list)
  end

  def count(list) do
    # Please implement the count/1 function
    length(list)
  end

  def functional_list?(list) do
    # Please implement the functional_list?/1 function
    list
    |> List.foldl(false, fn language, found ->
      found or language === "Elixir"
    end)
  end
end
