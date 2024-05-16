defmodule HighScore do
  @initial_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ nil) do
    Map.put(scores, name, score || @initial_score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @initial_score)
  end

  def update_score(scores, name, addition) do
    Map.update(scores, name, addition, fn score -> score + addition end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
