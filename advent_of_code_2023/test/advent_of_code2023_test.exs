defmodule AdventOfCode2023Test do
  use ExUnit.Case
  doctest AdventOfCode2023

  test "greets the world" do
    assert AdventOfCode2023.hello() == :world
  end
  
  test "1" do
    assert AdventOfCode2023.getFirstLastNumber("1abc2") == 12
    assert AdventOfCode2023.checkInput("1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet") == [12, 38, 15, 77]
    assert AdventOfCode2023.sumCheckInput([12, 38, 15, 77]) == 142
  end
  
  test "1.1" do
    assert AdventPart2.replaceWordWithDigit("eightwothree") == "8wo3"
    assert AdventPart2.replaceWordWithDigit("eighttwothree") == "823"
    assert AdventPart2.getFirstLastNumber("1abc2") == 12
    assert AdventPart2.getFirstLastNumber("eightwothree") == 83
    assert AdventPart2.checkString("two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen") == [29, 83, 13, 24, 42, 14, 76]
    assert AdventPart2.sumList([29, 83, 13, 24, 42, 14, 76]) == 281
  end
  
  test "2" do
    assert AdventPart2.replaceWordWithDigit("fouronevhnrz44
    eightg1
    4ninejfpd1jmmnnzjdtk5sjfttvgtdqspvmnhfbm
    78seven8
    6pcrrqgbzcspbd
    7sevenseven
    1threeeight66
    one1sevensskhdreight
    rninethree6") == "41vhnrz44
    8g1
    49jfpd1jmmnnzjdtk5sjfttvgtdqspvmnhfbm
    7878
    6pcrrqgbzcspbd
    777
    13866
    117sskhdr8
    r936"
  end
end
