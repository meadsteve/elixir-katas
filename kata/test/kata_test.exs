defmodule KataTest do
  use ExUnit.Case

  test "letters are sorted alphabetically to create a key" do
    assert Kata.word_key("dog") == 'dgo'
    assert Kata.word_key("steve") == 'eestv'
  end

  test "words can be added and retrieved by their key" do
    dict = Kata.WordDictionary.new
    |> Kata.WordDictionary.add_word("steve")

    assert Kata.WordDictionary.words_with_key(dict, 'eestv') == ["steve"]
  end

  test "words can also be retrieved by passing in the original word" do
    dict = Kata.WordDictionary.new
    |> Kata.WordDictionary.add_word("steve")

    assert Kata.WordDictionary.words_like(dict, "steve") == ["steve"]
  end

  test "multiple words with the same key stack up" do
    dict = Kata.WordDictionary.new
    |> Kata.WordDictionary.add_word("dog")
    |> Kata.WordDictionary.add_word("god")

    assert Kata.WordDictionary.words_like(dict, "dog") == ["god", "dog"]
  end

  test "don't care about no case" do
    dict = Kata.WordDictionary.new
    |> Kata.WordDictionary.add_word("StevE")

    assert Kata.WordDictionary.words_like(dict, "sTeve") == ["steve"]
  end

end
