defmodule Advent.DayTwo.P1Test do
  use ExUnit.Case

  alias Advent.DayTwo.P1

  test "checksum" do
    {:ok, io} = StringIO.open("""
        abcdef
        bababc
        abbcde
        abcccd
        aabcdd
        abcdee
        ababab
        """)
    assert P1.checksum(IO.stream(io, :line)) == 12
  end
end
