defmodule Advent.DayOne.Two do
  def second_coming() do
    file_input()
    |> Stream.cycle()
    |> Enum.reduce_while({0, MapSet.new()}, fn change, {freq, map} ->
      new_freq = freq + String.to_integer(change)

      case MapSet.member?(map, new_freq) do
        true ->
          {:halt, new_freq}

        _ ->
          {:cont, {new_freq, MapSet.put(map, new_freq)}}
      end
    end)
  end

  defp file_input(file_path \\ "#{__DIR__}/input.txt") do
    file_path
    |> Path.expand()
    |> File.read!()
    |> String.split("\n", trim: true)
  end
end
