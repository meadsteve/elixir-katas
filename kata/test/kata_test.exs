defmodule KataTest do
  use ExUnit.Case

  test "Zero results in an empty string" do
    assert Kata.to_numerals(0) == ""
  end

  test "1 to 3 are represented by Is" do
    assert Kata.to_numerals(1) == "I"
    assert Kata.to_numerals(2) == "II"
    assert Kata.to_numerals(3) == "III"
  end

  test "4 is represented by IV" do
    assert Kata.to_numerals(4) == "IV"
  end

  test "5 is represented by V" do
    assert Kata.to_numerals(5) == "V"
  end

  test "6 to 8 are represented correctly" do
    assert Kata.to_numerals(6) == "VI"
    assert Kata.to_numerals(7) == "VII"
    assert Kata.to_numerals(8) == "VIII"
  end

end
