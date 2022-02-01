defmodule Calculator do
  use ExUnit.Case
  @moduletag :calculator

  test "Calculator.add/1 should takes a String and return an Integer" do
    assert Calculator.add("13") == 13

    assert Calculator.add("127") == 127

    assert Calculator.add("1300") == 1300

    assert Calculator.add("9087") == 9087

    assert Calculator.add("10072") == 10072

    assert Calculator.add("11191") == 11191
  end
end
