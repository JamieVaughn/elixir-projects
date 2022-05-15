
defmodule S do

  def test do
    IO.puts "Hello"
  end

  def greet do
    receive do
      :greetings ->
        IO.puts "Greetings"
        greet()
      :reload ->
        IO.puts "Reloading"
        S.greet()
      true -> IO.puts "What?"
    end
    # greet() # tail call optimized for stack efficiency
  end

end
