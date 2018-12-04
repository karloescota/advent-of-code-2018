defmodule Advent.DayOne.Two do
  def second_coming do
    [{freq, _}] =
      file_stream()
      |> Stream.map(&String.trim(&1, "\n"))
      |> Stream.map(&String.to_integer(&1))
      |> Stream.cycle()
      |> Stream.scan({0, %{0 => 1}}, fn change, {freq, map} ->
        new_freq = freq + change
        {new_freq, Map.update(map, new_freq, 1, &(&1 + 1))}
      end)
      |> Stream.filter(fn {freq, map} -> Map.get(map, freq) == 2 end)
      |> Enum.take(1)

    freq
  end

  defp file_stream(file_path \\ "#{__DIR__}/one_input.txt") do
    File.stream!(Path.expand(file_path))
  end
end
