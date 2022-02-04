defmodule SimpleCalculatorCorrectedVersion do
  alias SimpleCalculatorCorrectedVersion.{ComaEndLineError, EndLineError, InvalidSeparatorError, NegativeError}

  @default_separators [",", "\n"]

  @separator_for_separators_opts "\n"

  def add(nbs_string) do
    nbs_string
    |> get_numbers_and_separators()
    |> handle_exceptions()
    |> parse_to_numbers()
    |> raise_if_negative_numbers()
    |> Enum.filter(fn nb -> nb < 1001 end)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  defp get_numbers_and_separators(nbs_string) do
    default = %{numbers: nbs_string, separators: @default_separators}

    case String.split(nbs_string, @separator_for_separators_opts) do
      [separators, numbers] ->
        if is_integer_in_string?(separators),
          do: default,
          else: %{numbers: numbers, separators: split_separators(separators)}

      _default ->
        %{numbers: nbs_string, separators: @default_separators}
    end
  end

  defp handle_exceptions(%{numbers: nbs_string} = nbs_and_seps) do
    raise_if_invalid_separators(nbs_and_seps)

    cond do
      String.contains?(nbs_string, ",\n") ->
        raise ComaEndLineError

      String.last(nbs_string) == "," ->
        raise EndLineError

      true ->
        nbs_and_seps
    end
  end

  defp is_integer_in_string?(val) do
    val |> String.to_integer() |> is_integer()
  rescue
    _ ->
      false
  end

  defp raise_if_invalid_separators(%{numbers: ns, separators: seps}) do
    chars = String.graphemes(ns)

    Enum.with_index(chars, fn nb_or_char, index ->
      unless is_integer_in_string?(nb_or_char) || nb_or_char == "-" ||
               Enum.member?(seps, nb_or_char) do
        raise InvalidSeparatorError, %{
          position: index,
          invalid_character: nb_or_char,
          valid_characters: seps
        }
      end
    end)
  end

  defp raise_if_negative_numbers(numbers) do
    Enum.map(numbers, fn nb ->
      if nb < 0, do: raise(NegativeError, %{negative_number: nb}), else: nb
    end)
  end

  defp parse_to_numbers(%{numbers: nbs, separators: seps}) do
    nbs
    |> String.split(seps)
    |> Enum.map(fn nb -> String.to_integer(nb) end)
  end

  defp split_separators(separators) do
    separators
    |> String.split("")
    |> Enum.filter(fn sep -> sep != "" end)
    |> Enum.uniq()
  end
end
