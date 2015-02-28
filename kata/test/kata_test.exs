defmodule KataTest do
  use ExUnit.Case

  test "empty string returns 0" do
    assert Kata.string_add("") == 0
  end

  test "returns the value of a single number given to it" do
    assert Kata.string_add("4") == 4
    assert Kata.string_add("7") == 7
  end

  test "sums together two numbers seperated by commas" do
    assert Kata.string_add("4,5") == 9
    assert Kata.string_add("8,12") == 20
  end

  test "sums together three numbers seperated by commas" do
    assert Kata.string_add("4,5,1") == 10
    assert Kata.string_add("2,12,2") == 16
  end

  test "handles newlines and white space as well as commas" do
    assert Kata.string_add("4 5") == 9
    assert Kata.string_add("4\n5") == 9
    assert Kata.string_add("4\t5") == 9
  end

  test "can trim out whitespace around numbers" do
    assert Kata.string_add("4, 5") == 9
    assert Kata.string_add("4 ,5") == 9
    assert Kata.string_add("4, 5 ") == 9
  end

  test "fail when negative numbers are given" do
    assert_raise ArgumentError, "Negative numbers aren't allowed", fn ->
      Kata.string_add("4,-5")
    end
  end

end
