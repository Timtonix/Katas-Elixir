defmodule SimpleCalculatorTest do
  use ExUnit.Case
  @moduletag :simple_calculator
  alias SimpleCalculator.EndLineError

  describe "SimpleCaculator" do
    # 0.
    test "add/1 should takes a String and returns a integer" do
      assert SimpleCalculator.add("0") == 0

      assert SimpleCalculator.add("42") == 42
    end

    # 1.
    test "add/1 should take to two numbers, separated by commas, and will return their sum as a result" do
      assert SimpleCalculator.add("1,1") == 2

      assert SimpleCalculator.add("3,7") == 10

      assert SimpleCalculator.add("42,58") == 100
    end

    # 2.
    test "add/1 should allow the add function to handle an unknown number of arguments" do
      assert SimpleCalculator.add("1,1,1") == 3

      assert SimpleCalculator.add("3,7,3,4") == 17

      assert SimpleCalculator.add("42,58,100,2,76") == 278
    end

    # 3.
    test "add/1 should Allow the add function to handle newlines as separators, instead of comas" do
      assert SimpleCalculator.add("1,1\n1") == 3

      assert SimpleCalculator.add("3,7\n3,4") == 17

      assert SimpleCalculator.add("42\n58,100,2,76") == 278
    end

    # 4.
    test "add/1 should add validation to not to allow a separator at the end" do
      assert_raise EndLineError, "It's not possible to have a separator at end of string", fn ->
        SimpleCalculator.add("3,7\n3,")
      end
    end

    # 5.
    test "add/1 should Allow the add method to handle different delimiters" do
      assert SimpleCalculator.add("//|1|1|1") == 3

      assert SimpleCalculator.add("//;3;7\n3,4") == 17
    end
  end
end
