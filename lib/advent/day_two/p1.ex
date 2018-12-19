defmodule Advent.DayTwo.P1 do
  def checksum(file_stream) do
    file_stream
    |> Stream.map(&String.graphemes/1)
    |> Stream.map(&map_by_character(&1, %{}))
    |> Enum.reduce({0, 0}, fn line, {twice, thrice} ->
      twice =
        case Enum.find(line, fn {_key, value} -> value == 2 end) do
          nil ->
            twice
          _ ->
            twice + 1
        end

      thrice =
        case Enum.find(line, fn {_key, value} -> value == 3 end) do
          nil ->
            thrice
          _ ->
            thrice + 1
        end
      {twice, thrice}
    end)
    |> multiply()
  end

  def multiply({twice, thrice}), do: twice * thrice

  def map_by_character([head | tail], map) do
    map = Map.update(map, head, 1, &(&1 + 1))
    map_by_character(tail, map)
  end

  def map_by_character([], map), do: map

  def stream(file_path \\ "#{__DIR__}/input.txt") do
    file_path
    |> Path.expand()
    |> File.stream!()
    |> Stream.map(&String.split(&1, "\n", trim: true) |> List.first())
  end
end
