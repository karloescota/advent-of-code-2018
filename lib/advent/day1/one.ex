defmodule Advent.Day1.One do
  def sum() do
    case read_file() do
      {:ok, file} ->
        file
        |> String.trim()
        |> String.split("\n")
        |> Enum.reduce(0, &(String.to_integer(&1) + &2))

      {:error, reason} ->
        reason
    end
  end

  defp read_file(file_path \\ "#{__DIR__}/d1_input.txt") do
    File.read(Path.expand(file_path))
  end
end
