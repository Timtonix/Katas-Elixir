defmodule SimpleCalculatorCorrectedVersionTest do
  use ExUnit.Case

  alias SimpleCalculatorCorrectedVersion.{ComaEndLineError, EndLineError, InvalidSeparatorError, NegativeError}

  @moduletag :simple_calculator_corrected_version

  describe "SimpleCaculator" do
    # 0.
    test "add/1 should takes a String and returns a integer" do
      assert SimpleCalculatorCorrectedVersion.add("0") == 0

      assert SimpleCalculatorCorrectedVersion.add("42") == 42
    end

    # 1.
    test "add/1 should take to two numbers, separated by commas, and will return their sum as a result" do
      assert SimpleCalculatorCorrectedVersion.add("1,1") == 2

      assert SimpleCalculatorCorrectedVersion.add("3,7") == 10

      assert SimpleCalculatorCorrectedVersion.add("42,58") == 100
    end

    # 2.
    test "add/1 should handle an unknown number of arguments" do
      assert SimpleCalculatorCorrectedVersion.add("1,1,1") == 3

      assert SimpleCalculatorCorrectedVersion.add("3,7,3,7,3,7") == 30

      assert SimpleCalculatorCorrectedVersion.add("42,58,42,58") == 200
    end

    # 3.
    test "add/1 should handle newlines as separators, instead of comas" do
      assert SimpleCalculatorCorrectedVersion.add("1\n1\n1") == 3

      assert SimpleCalculatorCorrectedVersion.add("3\n7\n3\n7\n3\n7") == 30

      assert SimpleCalculatorCorrectedVersion.add("42\n58\n42\n58") == 200
    end

    # 3.
    test "add/1 should not to allow ',\n'" do
      assert_raise SimpleCalculatorCorrectedVersion.ComaEndLineError, fn ->
        SimpleCalculatorCorrectedVersion.add("1,\n1,\n1")
      end
    end

    # 4.
    test "add/1 should not to allow a separator at the end" do
      assert_raise EndLineError, fn ->
        SimpleCalculatorCorrectedVersion.add("1,1,1,")
      end
    end

    # 5.
    test "add/1 should handle different delimiters" do
      # 5.0
      assert SimpleCalculatorCorrectedVersion.add("1\n1") == 2

      assert SimpleCalculatorCorrectedVersion.add(";\n1;3") == 4

      # 5.1
      assert SimpleCalculatorCorrectedVersion.add("|\n1|2|3") == 6

      # 5.2
      assert SimpleCalculatorCorrectedVersion.add("sep\n2s1e2p5") == 10
    end

    # 6.
    test "add/1 should raise if presence of negative numbers" do
      assert_raise NegativeError,
                   "Negative number(s) not allowed: -2",
                   fn ->
                     SimpleCalculatorCorrectedVersion.add("1,-2")
                   end
    end

    # 7.
    test "add/1 should raise an error with the message \"'|' expected but ',' found at position 3\"" do
      assert_raise InvalidSeparatorError,
                   "'|' expected but ',' found at position 3",
                   fn ->
                     SimpleCalculatorCorrectedVersion.add("|\n1|2,3")
                   end
    end

    # 8.
    test "add/1  should ignore numbers bigger than 1000" do
      assert SimpleCalculatorCorrectedVersion.add("2,1,1001") == 3
    end
  end
end
