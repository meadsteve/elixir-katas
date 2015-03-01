defmodule Kata do
  def word_key(word) do
    word
    |> String.to_char_list
    |> Enum.sort
  end
end
