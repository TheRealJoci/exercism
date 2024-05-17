defmodule TakeANumber do
  defp listener(state) do
    receive do
      {:report_state, pid} ->
        send(pid, state)
        listener(state)

      {:take_a_number, pid} ->
        send(pid, state = state + 1)
        listener(state)

      :stop ->
        :stop

      _msg ->
        listener(state)
    end
  end

  def start() do
    spawn(fn -> listener(0) end)
  end
end
