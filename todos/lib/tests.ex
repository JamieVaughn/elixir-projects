require Code
require OptionParser
# Code.require_file "../test/test_helper.exs", __FILE__

defmodule CliTest do
  use ExUnit.Case

   def parse_args(list) do
    OptionParser.parse(list)
   end

  test "nil returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "Count is defaulted if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 5}
  end
end
