defmodule AdventOfCode2023Test do
  use ExUnit.Case
  doctest AdventOfCode2023

  test "greets the world" do
    assert AdventOfCode2023.hello() == :world
  end
  
  test "1" do
    asset AdventOfCode2023.getFirstLastNumber("1abc2") == 12
    assert AdventOfCode2023.checkInput("1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet") == [12, 38, 15, 77]
    assert AdventOfCode2023.sumCheckInput([12, 38, 15, 77]) == 142
  end
end
