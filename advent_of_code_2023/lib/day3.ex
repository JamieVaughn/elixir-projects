defmodule Day3 do
  
  def getWidth (input) do
    input
      |>String.split("\n")
      |>List.first
      |>String.length
  end
  
  def getSymbolIdxList (input) do
    _width = Day3.getWidth(input)
    str = String.split(input) |> to_string
    Regex.scan(~r/[*|#|$|+]/, str, return: :index)
      |> List.flatten
      |> Enum.map(fn (x) -> elem(x, 0) end)
      # |> IO.inspect
      
  end
  
  def getPartNumbersIdx(input) do
    _width = Day3.getWidth(input)
    str = String.split(input) |> to_string
    Regex.scan(~r/\d+/, str, return: :index)
    |> List.flatten
    |> Enum.map(fn (x) -> x end)
    # |> IO.inspect
  end
  
  def isAdjacent(symb, num, width) do
    adj = symb+1 == num ||
    symb-1 == num || 
    symb+width == num || 
    symb-width == num ||
    symb-width-1 == num ||
    symb-width+1 == num ||
    symb+width-1 == num ||
    symb+width+1 == num 
    if adj == true do
      IO.inspect([adj, symb, num])
    end
    adj
  end
  
  def isPartNumberAdjacent(input) do
    width = Day3.getWidth(input)
    str = String.split(input) |> to_string
    Day3.getPartNumbersIdx(input)
    |> Enum.filter(fn (num) -> 
      Day3.getSymbolIdxList(input)
      |> Enum.each(fn (symb) -> 
        Enum.any?(1..elem(num, 1), fn (idx) -> 
          isAdjacent(symb, elem(num, 0) + idx, width)
        end)
      end)   
    end)
    |> Enum.map(fn y -> 
        Enum.map(1..elem(y, 1), fn z -> 
          Enum.at(String.graphemes(str), (elem(y, 0) - 1 + z)) end)
     end)
    |> Enum.map(fn x -> 
        Enum.join(x, "")
    end)
    |> Enum.map(fn x -> 
        String.to_integer(x)
    end)
    
  end
end
