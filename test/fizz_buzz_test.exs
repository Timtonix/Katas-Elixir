defmodule FizzBuzzTest do
  use ExUnit.Case
  test "FizzBuzz.run/1 should accepts a number as input and returns it as a String." do
    assert FizzBuzz.run(13) == "13"

    assert FizzBuzz.run(143) == "143"

    assert FizzBuzz.run(12389) == "12389"

    assert FizzBuzz.run(122) == "122"

    assert FizzBuzz.run(2) == "2"
  end

  test "FizzBuzz.run/1 should return '0' when 0" do
    assert FizzBuzz.run(0) == "0"
  end

  test "FizzBuzz.run/1 should return 'Fizz' when three multiples" do
    assert FizzBuzz.run(3) == "Fizz"

    assert FizzBuzz.run(12) == "Fizz"

    assert FizzBuzz.run(27) == "Fizz"

    assert FizzBuzz.run(42) == "Fizz"

    assert FizzBuzz.run(9) == "Fizz"
  end

  test "FizzBuzz.run/1 should return 'Buzz' when five multiples" do
    assert FizzBuzz.run(5) == "Buzz"

    assert FizzBuzz.run(25) == "Buzz"

    assert FizzBuzz.run(35) == "Buzz"

    assert FizzBuzz.run(95) == "Buzz"

    assert FizzBuzz.run(10) == "Buzz"
  end

  test "FizzBuzz.run/1 should return 'FizzBuzz' when both five and three multiples" do
    assert FizzBuzz.run(15) == "FizzBuzz"

    assert FizzBuzz.run(30) == "FizzBuzz"

    assert FizzBuzz.run(45) == "FizzBuzz"

    assert FizzBuzz.run(60) == "FizzBuzz"

    assert FizzBuzz.run(90) == "FizzBuzz"
  end
end
