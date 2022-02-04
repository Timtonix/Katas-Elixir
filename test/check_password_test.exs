defmodule CheckPasswordTest do
  use ExUnit.Case
  @moduletag :check_password

  test "CheckPassword.run/1 should takes a string as an input and returns a validation result if it's a string." do
    assert CheckPassword.run("zefmohzfosjcmiqyfqiu") == "The password must contain at least 2 numbers\nPassword must contain at least one capital letter\nPassword must contain at least one special character\n"

    assert CheckPassword.run(939_408_393) == false

    assert CheckPassword.run(:isanatom) == false

    assert CheckPassword.run(["Hi", "Ho", "djpds"]) == false
  end

  test "CheckPassword.run/1 should takes a string as an input and returns a validation result if it's longer than 8" do
    assert CheckPassword.run("isapassword") == "The password must contain at least 2 numbers\nPassword must contain at least one capital letter\nPassword must contain at least one special character\n"

    assert CheckPassword.run("short") == "Password must be at least 8 characters\nThe password must contain at least 2 numbers\nPassword must contain at least one capital letter\nPassword must contain at least one special character\n"
  end

  test "CheckPassword.run/1 the string must contain at least 2 numbers." do
    assert CheckPassword.run("122222222222") == "Password must contain at least one capital letter\nPassword must contain at least one special character\n"

    assert CheckPassword.run("p4ssword") == "The password must contain at least 2 numbers\nPassword must contain at least one capital letter\nPassword must contain at least one special character\n"
  end

  test "CheckPassword.run/1 the string must contains 1 capital letter" do
    assert CheckPassword.run("P4ssw0rd") == "Password must contain at least one special character\n"
  end

  test "CheckPassword.run/1 the string must contains 1 special character" do
    assert CheckPassword.run("P4ssw0r*d") == true

    assert CheckPassword.run("p4s$sWor9") == true
  end
end
