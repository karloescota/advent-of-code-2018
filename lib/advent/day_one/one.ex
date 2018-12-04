defmodule Advent.DayOne.One do
  def sum() do
    file_input()
    |> Enum.reduce(0, &(String.to_integer(&1) + &2))
  end

  defp file_input(file_path \\ "#{__DIR__}/input.txt") do
    file_path
    |> Path.expand()
    |> File.read!()
    |> String.split("\n", trim: true)
  end
end
