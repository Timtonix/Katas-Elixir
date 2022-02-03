defmodule SimpleCalculator do
  alias SimpleCalculator.EndLineError
  alias SimpleCalculator.TwoSeparatorsError
  alias SimpleCalculator.SeparatorError
  alias SimpleCalculator.NegativeNumberError

  @chiffres ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def add(nb_string) do
    # Manipulation de nb_string
    # separator = is_sep(nb_string)
    separator = know_separator(nb_string)

    cond do
      String.starts_with?(nb_string, @chiffres) ->
        calc(nb_string, separator)

      true ->
        nb_string = String.replace_prefix(nb_string, "#{separator}\n", "")
        calc(nb_string, separator)
    end
  end

  defp calc(nb_string, separator) do
    nb_string
    |> raise_error(separator)
    |> String.split([",", "\n"] ++ separator)
    |> Enum.reduce(0, fn x, acc -> String.to_integer(x) + acc end)
  end

  defp know_separator(string) do
    cond do
      String.starts_with?(string, @chiffres) ->
        [","]

      String.starts_with?(string, "-") ->
        read_negative_number(string)

      true ->
        separator = Enum.at(String.split(string, "\n"), 0)
        String.split(separator, "", trim: true)
    end
  end

  defp raise_error(string, separator) do
    separator = separator ++ ["\n"]
    split_string = String.replace(string, Enum.concat(@chiffres, separator), "")

    cond do
      # Check Negative Numbers
      String.contains?(split_string, "-") ->
        read_negative_number(string)

      String.contains?(string, ["\n,", ",\n"]) ->
        raise TwoSeparatorsError

      String.ends_with?(string, [",", "\n"] ++ separator) ->
        raise EndLineError

      # Check Separators Allowed
      split_string != "" ->
        raise SeparatorError,
          message: "You can use only these separator(s) : '#{separator}'"

      true ->
        string
    end
  end

  # Lire et déclarer le nombre négatif
  defp read_negative_number(string) do
    neg_numb = String.split(string, [","])

    raise NegativeNumberError,
      message: "Negative number(s) not allowed: #{neg_numb}"
  end

  defmodule EndLineError do
    defexception message: "It's not possible to have a separator at end of string"
  end

  defmodule SeparatorError do
    defexception [:message]
  end

  defmodule TwoSeparatorsError do
    defexception message: "It is not possible to have two separators side by side"
  end

  defmodule NegativeNumberError do
    defexception [:message]
  end
end
