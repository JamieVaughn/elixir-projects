defmodule AdventOfCode2023 do
  @moduledoc """
  Documentation for `AdventOfCode2023`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AdventOfCode2023.hello()
      :world

  """
  def hello do
    :world
  end
  
  def getFirstLastNumber(input) do
    Regex.run(~r/\d/, input)
    |> Enum.concat(Regex.run(~r/\d/, String.reverse(input)))
    |> Enum.join()
    |> String.to_integer()
  end
  
  def checkInput(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> getFirstLastNumber(x) end)
  end
  def sumCheckInput(arr) do
    arr
    |> Enum.sum()
  end
end
