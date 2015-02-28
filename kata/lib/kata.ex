defmodule Kata do

  def to_numerals(number \\ 0, current_numeral \\ "")

  def to_numerals(0, current_numeral) do
    current_numeral
  end

  def to_numerals(number, current_numeral) when number >= 5 do
    to_numerals(number - 5, current_numeral <> "V")
  end

  def to_numerals(number, current_numeral) when number >= 4 do
    to_numerals(number - 4, current_numeral <> "IV")
  end

  def to_numerals(number, current_numeral) when number >= 1 do
    to_numerals(number - 1, current_numeral <> "I")
  end

end
