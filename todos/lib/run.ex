defmodule Run do
  # example of unclear function
  def run(x) do
    1
    |> List.duplicate(x)
    |> Integer.undigits()
    |> Stream.iterate(fn prev ->
      prefix = (prev + 1)
        |> Integer.digits()
        |> List.insert_at(0, 0)
        |> Stream.chunk_every(2, 1, :discard)
        |> Stream.take_while(fn [a, b] -> a <= b end)
        |> Enum.map(fn [_ , b] -> b end)

      suffix = prefix
        |> List.last()
        |> List.duplicate(length(Integer.digits(prev + 1)) - length(prefix))

      Integer.undigits(prefix ++ suffix)
    end)
    |> Stream.take_while(&(&1 < Integer.pow(10, x)))
    |> Enum.count()
  end
  # example of same function but with clarity
  def clear(length) do
    for _step <- 1..(length - 1)//1,
    digit <- 9..1,
    reduce: {9, 8, 7, 6, 5, 4, 3, 2, 1} do
      counts ->
        carry = if digit == 9, do: 0, else: elem(counts, digit)
        count = elem(counts, digit - 1) + carry
        put_elem(counts, digit - 1, count)
    end
    |> elem(0)
  end
end
