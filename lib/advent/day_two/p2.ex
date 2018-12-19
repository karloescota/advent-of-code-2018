defmodule Advent.DayTwo.P2 do
  @jaro_distance 0.9743589743589745

  def box_id(file_stream, jaro \\ @jaro_distance) do
    file_stream
    |> Stream.map(&IO.inspect(&1, line: "after scan"))
    |> Enum.reduce_while([], fn line, acc ->
      case Enum.find(acc, fn str -> String.jaro_distance(line, str) == jaro end) do
        nil ->
          {:cont, [line | acc]}
        found ->
          {:halt, common_ids(line, found)}
      end
    end)
  end

  def stream(file_path \\ "#{__DIR__}/input.txt") do
    file_path
    |> Path.expand()
    |> File.stream!()
    |> Stream.map(&String.split(&1, "\n", trim: true) |> List.first())
  end

  defp common_ids(line, found) do
    String.myers_difference(line, found)
    |> Keyword.take([:eq])
    |> Keyword.values()
    |> Enum.join("")
  end
end
