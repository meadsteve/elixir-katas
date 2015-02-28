defmodule Kata do

  def string_add("") do
    0
  end

  def string_add(input_string) do
    input_string
    |> split_the_string
    |> convert_them_all_to_ints
    |> Enum.sum
  end

  defp split_the_string(string) do
    String.split(string, ~r/[, \n\t]/, trim: true)
  end

  defp convert_them_all_to_ints(string_numbers) do
    Enum.map(string_numbers, &string_to_integer/1)
  end

  defp string_to_integer(number_string) do
    {number, _} = Integer.parse(number_string)
    if number < 0, do: raise(ArgumentError, message: "Negative numbers aren't allowed")
    number
  end

end
