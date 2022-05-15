require Kernel
require Enum
require IO

defmodule Forjs do
  def filter do
    people = [%{name: "Bob", age: 30}, %{name: "Bill", age: 18}]
    old_enough = Enum.filter(people, fn %{age: age} -> age > 21 end) |> Enum.map(fn n -> n.name end)
    old_enough
  end

  def sumReduce(lst) do
    Enum.reduce(lst, 0, fn n, acc -> n + acc end)
  end

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def map([], _func), do: []
  def map([head | tail], func) do
    [ func.(head) | map(tail, func) ]
  end

  def formula do
    score = 4
    score |> Kernel./(2) |> :math.pow(-1) |> Kernel.*(100)
  end

  def destructure do
    o = %{nested: %{prop: "Hi"}}
    %{nested: %{prop: prop}} = o
    IO.inspect(prop)
  end

  defstruct name: nil, age: nil

  # instead of if statements use pattern matching on multiple arity fns
  def list(%{is_admin: true}) do
    store.list_all()
  end
  def list(user) do
    store.list_for_user(user)
  end
  def store do

  end

  # control flow
  def resp do
    get_response = :ok
    case get_response do
      {:ok, _} -> "Success"
      {:error, %{reason: "Unauthorized"}} -> "Not Allowed"
      {:error, _} -> "There was an error"
    end
  end

  def check do
    foo = "fo"
    bar = 2
    cond do
      foo == "foo" -> "success"
      bar < 1 -> "Not Allowed"
      true -> "There was an error" # last line true is the catchall default case
    end
  end

  def unlessflow do
    # if n > 100, do: 100, else: n # like a ternary statement
    n = 99
    unless n > 100 do
      n
    else
      100
    end
  end

  # with statements, a type of control flow
  def create(params) do
    with {:ok, dob} <- parse_dob(params["dob"]),
         {:ok, name} <- parse_name(params["name"])
    do
      # %User{dob: dob, name: name}
      "User"
    else
      # nil -> {:error, ...} an example that we can match here too
      err -> err
    end
  end

  defp parse_dob(nil), do: {:error, "dob is required"}
  defp parse_dob(dob) when is_integer(dob), do: {:ok, dob}
  defp parse_dob(_invalid), do: {:error, "dob must be an integer"}

  defp parse_name(nil), do: {:error, "name is required"}
  defp parse_name(""), do: parse_name(nil)
  defp parse_name(name), do: {:ok, name}


  # example of arity pattern matching
  def fib(0), do: 1
  def fib(1), do: 1
  def fib(n) when n <= 1, do: 1 # better way to above two lines
  def fib(n) when n>=2, do: fib(n-2) + fib(n-1)
end
