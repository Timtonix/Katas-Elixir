defmodule SimpleCalculator do
  alias SimpleCalculator.EndLineError

  @separators ["//", "\n"]

  def add(nb_string) do
    #On doit connaitre le séparateur
    separator = know_separator(nb_string)
    nb_string
    |> trim_string(separator)
    |> handle_string()
    |> String.split(separator)
    |> Enum.reduce(0, fn x, acc -> String.to_integer(x) + acc end)
  end

  defp handle_string(string) do
    if String.ends_with?(string, [","]) do
      raise EndLineError
    else
      string
    end
  end

  defp know_separator(nb_string) do
    if String.starts_with?(nb_string, "//") do
      list = String.split(nb_string, @separators)
      List.delete_at(list, 0)
      [Enum.at(list, 1), "\n"]
    else
      [",", "\n"]
    end
  end

  defp trim_string(nb_string, separator) do
    if String.starts_with?(nb_string, "//") do
     ^nb_string = String.replace(nb_string, "//#{separator}\n", "")
    else
      nb_string
    end
  end

  defmodule EndLineError do
    defexception message: "It's not possible to have a separator at end of string"
  end
end
