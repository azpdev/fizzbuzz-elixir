defmodule FizzBuzz do
  use Application

  @moduledoc """
  Documentation for `FizzBuzz`.
  """

  @doc """

  """
  def start(_type, _args) do
    fizzBuzz(50)
    Task.Supervisor.start_link([])
  end

  defp fizzBuzz(n) do
    Enum.each(
      1..n,
      fn x ->
        [Integer.to_string(x)]
        |> fizzPrint(x)
        |> buzzPrint(x)
        |> List.foldl("", fn (e, acc) -> acc <> " " <> e end)
        |> IO.puts
      end
    )
  end

  defp fizzPrint(arr, x) do
    if rem(x, 2) == 0 do
      arr ++ ["Fizz"]
    else
      arr
    end
  end

  defp buzzPrint(arr, x) do
    if rem(x, 5) == 0 do
      arr ++ ["Buzz"]
    else
      arr
    end
  end
end
