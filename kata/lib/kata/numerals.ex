defmodule Kata.Numerals do

  # Callback invoked by `use`.
  defmacro __using__(_opts) do
    quote do
      import Kata.Numerals
      def to_numerals(number \\ 0, current_numeral \\ "")

      def to_numerals(0, current_numeral) do
        current_numeral
      end
    end
  end

  defmacro define_numeral(value, numeral) do
    quote do
      def to_numerals(number, current_numeral) when number >= unquote(value) do
        to_numerals(number - unquote(value), current_numeral <> unquote(numeral))
      end
    end
  end

end
