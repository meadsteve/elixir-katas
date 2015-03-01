defmodule Kata.WordDictionary do
  import Dict

  defstruct words: HashDict.new, key_function: &Kata.word_key/1

  def new do
    %Kata.WordDictionary{}
  end

  def new_from_file(path) do
    new |> parse_file(path)
  end

  def add_word(dict, word) do
    key = key_for_dict(dict, word)
    updated_words = store_word(dict.words, key, tidied_word(word))
    %{dict | words: updated_words}
  end

  def words_with_key(dict, key) do
    get(dict.words, key)
  end

  def words_like(dict, word) do
    key = key_for_dict(dict, word)
    get(dict.words, key)
  end

  defp store_word(words, key, word) do
    update(
      words,
      key,
      [word],
      fn(existing_words) -> [word | existing_words] |> Enum.uniq end
    )
  end

  defp key_for_dict(%{key_function: key_function}, word) do
    key_function.(tidied_word(word))
  end

  defp tidied_word(word) do
    String.downcase(word)
  end

  defp parse_file(initial_dict, path) do
    File.stream!(path)
    |> Stream.filter(&String.valid?/1)
    |> Stream.map(fn (word) -> String.rstrip(word, ?\n) end)
    |> Enum.reduce(initial_dict, fn(word, dict) -> add_word(dict, word) end)
  end

end
