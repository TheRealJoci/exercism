defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    "What is your character's name?\n"
    |> IO.gets()
    |> String.trim()
  end

  def ask_class() do
    "What is your character's class?\n"
    |> IO.gets()
    |> String.trim()
  end

  def ask_level() do
    "What is your character's level?\n"
    |> IO.gets()
    |> String.trim()
    |> String.to_integer()
  end

  def run() do
    welcome()

    Map.new()
    |> Map.put(:name, ask_name())
    |> Map.put(:class, ask_class())
    |> Map.put(:level, ask_level())
    |> IO.inspect(label: "Your character")
  end
end
