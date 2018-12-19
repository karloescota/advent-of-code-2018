defmodule Advent.DayTwo.P2Test do
  use ExUnit.Case

  alias Advent.DayTwo.P2

  test "checksum" do
    {:ok, io} = StringIO.open("""
    abcde
    fghij
    klmno
    pqrst
    fguij
    axcye
    wvxyz
    """)

    input =
      io
      |> IO.stream(:line)
      |> Stream.map(&String.split(&1, "\n", trim: true) |> List.first())

    assert P2.box_id(input, 0.8666666666666667) == "fgij"
  end
end
