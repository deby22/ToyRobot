defmodule ToyRobot.Application do
  use Application

  @impl true
  def start(_type, _args) do
    IO.inspect("test")
    Agent.start_link(fn -> nil end, name: :robot_state_repository)
    children = [ToyRobot.Server]
    opts = [strategy: :rest_for_one, name: ToyRobot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
