defmodule CheckPassword do
  @special [
    "#",
    "$",
    "%",
    "&",
    "'",
    "(",
    ")",
    "*",
    "+",
    ",",
    "-",
    ".",
    "/",
    ":",
    ";",
    "<",
    "=",
    ">",
    "?",
    "@",
    "[",
    "]",
    "^",
    "_",
    "`",
    "{",
    "|",
    "}",
    "~"
  ]
  @capital_letters [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ]

  def run(string) do
    cond do
      is_bitstring(string) ->
        check_string(string, "1", "")

      true ->
        false
    end
  end

  def check_string(string, message, premessage) do
    cond do
      message == "1" ->
        check_length(string)

      message == "length_ok" ->
        check_numbers(String.split(string, "", trim: true), 0, string, premessage)

      message == "numbers_ok" ->
        check_capital_letter(string, premessage)

      message == "capital_ok" ->
        check_special(string, premessage)

      true ->
        premessage
    end
  end

  defp check_length(string) do
    if String.length(string) >= 8 do
      check_string(string, "length_ok", "")
    else
      check_string(string, "length_ok", "Password must be at least 8 characters\n")
    end
  end

  defp is_integer_string?(val) do
    try do
      val |> String.to_integer() |> is_integer()
    rescue
      _ ->
        false
    end
  end

  defp check_numbers(list, number, string, premessage) do
    first = to_string(Enum.take(list, 1))
    inspect(premessage)

    cond do
      number == 2 ->
        check_string(string, "numbers_ok", premessage)

      is_integer_string?(first) ->
        check_numbers(List.delete_at(list, 0), number + 1, string, premessage)

      list != [] ->
        check_numbers(List.delete_at(list, 0), number, string, premessage)

      true ->
        check_string(string,"numbers_ok",premessage <> "The password must contain at least 2 numbers\n")
    end
  end

  defp check_capital_letter(string, premessage) do

    cond do
      String.contains?(string, @capital_letters) ->
        check_string(string, "capital_ok", premessage)

      true ->
        check_string(string, "capital_ok",premessage <> "Password must contain at least one capital letter\n")
    end
  end

  defp check_special(string, premessage) do
    cond do
      String.contains?(string, @special) ->
        check_string(string, "END", true)
      true ->
        check_string(string, "END", premessage <> "Password must contain at least one special character\n")
    end
    # cond do
    #   String.contains?(string, @special) ->
    #     if premessage == "" do
    #       premessage = true
    #       check_string(string, "numbers_ok", premessage)
    #     else
    #       check_string(string, "numbers_ok", premessage)
    #     end

    #   true ->
    #     check_string(string, "numbers_ok", premessage <> "Password must contain at least one special character\n")
    # end
  end
end
