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

  def right(%ToyRobot.Position{facing: facing} = robot) do
    # mayby ~w"north east south west" will be better?
    directions_to_the_right = %{north: :east, east: :south, south: :west, west: :north}
    %ToyRobot.Position{robot | facing: directions_to_the_right[facing]}
  end

  def left(%ToyRobot.Position{facing: facing} = robot) do
    directions_to_the_left = %{north: :west, west: :south, south: :east, east: :north}
    %ToyRobot.Position{robot | facing: directions_to_the_left[facing]}
  end
end
