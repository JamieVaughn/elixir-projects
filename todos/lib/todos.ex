require Integer
require String
require Calendar



defmodule Todos do
  def todos() do
    ["eat", "read", "elixir", "sleep"]
  end
  def simple_list do
    add = fn (a, b) -> a + b end
    array = 1..20
    for i <- array, Integer.is_even(i), do: add.(i, i)
  end
  def compound_list do
    mult = &(&1 * &2)
    list = for i <- [1,2,3], j <- [2,3,4], do: &Math.mult.(i, j)
    list
  end

  def contains?(task) do
    tasks = todos()
    Enum.member?(tasks, task)
  end

  def rand_task do
    tasks = todos()
    [task] = Enum.take_random(tasks, 1)
    task
  end

  def search_word(word) do
    tasks = todos()
    for task <- tasks, String.contains?(task, word), do: task
  end

  def create do
    IO.puts(DateTime.utc_now(Calendar.ISO))
    IO.puts("Add a todo")
    todo = IO.gets("") |> String.trim()
    todo_list = todos() ++ [todo]
    todo_list
  end

  def guess do
    answer = 51
    guesses = 3
    for guess <- 1..guesses, do: guess+1
    for guess <- 1..guesses do
      {number, _} = IO.gets("Guess a number: ") |> Integer.parse()
      if number == answer do
        IO.puts("correct")
        answer
      else
        IO.puts("incorrect")
      # else
      #   if number > answer do
      #     IO.puts("lower")
      #   else
      #     IO.puts("higher")
      #   end
      end
    end
    IO.gets("The correct answer was ", guess)
  end

  def char_freq(phrase) do
    String(word).trim() |> String.graphemes() |> Enum.frequencies()

  end

end
