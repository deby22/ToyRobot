defmodule ToyRobot do
  def report, do: ToyRobot.Server.report()
  def move, do: ToyRobot.Server.move()
  def left, do: ToyRobot.Server.left()
  def right, do: ToyRobot.Server.right()

  def terminate, do: ToyRobot.Server.terminate()
end
