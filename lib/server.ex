defmodule ToyRobot.Server do
  use GenServer

  def handle_call(:report, _from, current_state) do
    report = ToyRobot.ToyRobot.report(current_state)
    {:reply, report, current_state}
  end

  def handle_cast(:failure, _current_state) do
    {:noreply, ToyRobot.ToyRobot.failure()}
  end

  def handle_cast(:move, current_state) do
    {:noreply, ToyRobot.ToyRobot.move(current_state)}
  end

  def handle_cast(:left, current_state) do
    {:noreply, ToyRobot.ToyRobot.left(current_state)}
  end

  def handle_cast(:right, current_state) do
    {:noreply, ToyRobot.ToyRobot.right(current_state)}
  end

  def place do
    {:ok, state} = ToyRobot.ToyRobot.place()
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def trigger_failure do
    GenServer.cast(__MODULE__, :failure)
  end

  def report, do: GenServer.call(__MODULE__, :report)
  def move, do: GenServer.cast(__MODULE__, :move)
  def left, do: GenServer.cast(__MODULE__, :left)
  def right, do: GenServer.cast(__MODULE__, :right)

  def start_link(_opts) do
    place()
  end

  defp get_current_state() do
    case Agent.get(:robot_state_repository, & &1) do
      nil ->
        {:ok, state} = ToyRobot.ToyRobot.place()
        state

      state ->
        state
    end
  end

  def init(_) do
    {:ok, get_current_state()}
  end

  def terminate(_reason, current_state) do
    Agent.update(:robot_state_repository, fn _ -> current_state end)
  end
end
