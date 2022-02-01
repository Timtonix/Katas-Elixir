defmodule SimpleCalculator do
  alias SimpleCalculator.EndLineError

  def add(nb_string) do
    nb_string
    |> handle_string()
    |> String.split([",", "\n"])
    |> Enum.reduce(0, fn x, acc -> String.to_integer(x) + acc end)
  end

  defp handle_string(string) do
    if String.ends_with?(string, [",", "\n"]) do
      raise EndLineError
    else
      string
    end
  end

  defmodule EndLineError do
    defexception message: "It's not possible to have a separator at end of string"
  end
end
