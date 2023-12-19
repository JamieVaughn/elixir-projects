defmodule Day2 do
  # 12 red cubes, 13 green cubes, and 14 blue cubes?
  
  def addImpossible(list, map) do
    Map.new(map, {:impossible, length(list)})
  end
  def scanColorsString(input, color) do
    Regex.compile("\\d+(?= #{color})")
    |> Kernel.elem(1)
    |> Regex.scan(input)
    |> List.flatten
    |> Enum.map(fn (x) -> String.to_integer(x) end)
    |> Enum.sort 
    |> Enum.reverse
  end
  
  def transformGames(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn (x) -> String.split(x, ":") end)
    |> Enum.map(fn (x) -> 
        blues = Day2.scanColorsString(List.last(x), "blue")
        reds = Day2.scanColorsString(List.last(x), "red")
        greens = Day2.scanColorsString(List.last(x), "green")
        %{
        game: Regex.run(~r/\d+/, List.first(x))|>List.to_string|>String.to_integer, 
        blue: blues,
        red: reds,
        green: greens,
        impossible: Enum.sum([
          Enum.filter(blues, fn (y) -> y > 14 end)|>length, 
          Enum.filter(greens, fn (y) -> y > 13 end)|>length, 
          Enum.filter(reds, fn (y) -> y > 12 end)|>length
        ])
      } end)
      # |> IO.inspect
  end
  
  def sumPossibleGames(games) do
    transformGames(games)
      |> Enum.filter(fn (x) -> 
        Map.get(x, :impossible) == 0
      end)
      # |> IO.inspect
      |> Enum.map(fn (x) -> Map.get(x, :game) end)
      |> MapSet.new
      # |> IO.inspect
      |> Enum.sum
  end
  
  def maxPower(games) do
    transformGames(games)
    |> Enum.map(fn (x) -> 
      List.first(Map.get(x, :blue)) * List.first(Map.get(x, :red)) * List.first(Map.get(x, :green))
    end)
    |> Enum.sum
  end
end