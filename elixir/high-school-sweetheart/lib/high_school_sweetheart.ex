defmodule HighSchoolSweetheart do
  @ascii_heart """
       ******       ******
     **      **   **      **
   **         ** **         **
  **            *            **
  **                         **
  **     X. X.  +  X. X.     **
   **                       **
     **                   **
       **               **
         **           **
           **       **
             **   **
               ***
                *
  """

  def first_letter(name) do
    name
    |> String.trim_leading()
    |> String.slice(0, 1)
  end

  def initial(name) do
    name
    |> first_letter()
    |> String.upcase()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    full_name
    |> String.split(" ")
    |> Enum.map(fn name -> initial(name) end)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    [full_name1, full_name2]
    |> List.foldl(@ascii_heart, fn name, heart ->
      heart |> String.replace("X. X.", initials(name), global: false)
    end)
  end
end
