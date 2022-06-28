require Flow

defmodule StreamFile do
  # call as Flow.readFile('lib/flow.ex') or Flow.readFile('../todos/test/test_helper.exs') for example
  def readFile(path) do
    File.stream!(path)
    |> Enum.flat_map(&String.split(&1, " "))
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, & &1 + 1)
    end)
    |> Enum.to_list()
  end
end

# Flow.window
# Global window
# Count window
# Session window
# Fixed Window (event time - time that trigger event happens)
# Periodic Window (processing time - time the dispathc from the triggered event is received [by server])

# def readWindow do

# end
defmodule Simulator do
  def generate_events do
    Stream.repeatedly(fn -> values() end)
  end

  def values do
    {get_type(), get_speed()}
  end

  defp get_type do
    Enum.random([:car, :truck, :motorcycle])
  end

  defp get_speed do
    Enum.random(70..120) * Enum.random(0..1)
  end
end

window = Flow.Window.count(100)

# window = Flow.Window.gloabl()
#          |> Flow.Window.trigger_every(100)

# window = Flow.Window.periodic(3, :second)

Flow.from_enumerable(Simulator.generate_events())
|> Flow.filter(&elem(&1, 1) > 0)
|> Flow.partition(window: window, key: &elem(&1, 0), stages: 1)
|> Flow.reduce(
  fn -> %{} end,
  fn {type, speed}, result_map ->
    Map.update(result_map, "Count: #{type}", 1, &(&1 + 1))
    |> Map.update("Total speed: #{type}", speed, &(&1 + speed))
    |> Map.update(
      "Avg: #{type}",
      0,
      fn _value -> Float.round(Map.get(result_map, "Total speed: #{type}") / Map.get(result_map, "Count: #{type}") ) end
    )
  end
)
|> Flow.on_trigger(
  fn state ->
    IO.inspect(state, label: "Trigger")
    {[state], state}
  end
)
|> Flow.run()
