defmodule ToyRobot do
  @moduledoc """
  Documentation for `ToyRobot`.
  """

  def place do
    %ToyRobot.Position{}
  end

  def place(x, y, facing) do
    %ToyRobot.Position{x: x, y: y, facing: facing}
  end

  def report(%ToyRobot.Position{x: x, y: y, facing: facing}) do
    {x, y, facing}
  end
end
