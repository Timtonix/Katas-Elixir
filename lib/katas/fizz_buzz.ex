defmodule FizzBuzz do
  def run(0), do: "0"

  def run(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: "FizzBuzz"

  def run(number) when rem(number, 3) == 0, do: "Fizz"

  def run(number) when rem(number, 5) == 0, do: "Buzz"

  def run(number), do: Integer.to_string(number)
end
