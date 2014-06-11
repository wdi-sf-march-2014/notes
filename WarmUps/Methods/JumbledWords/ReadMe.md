# Warm Up
## Jumbled Words

## Background

You are TA for a 1st grade class and were driving down a bumpy street. When you got home you found the words you put in an array got jumbled, but not mixed together, e.g. `hello` just became `ohlle`. These words were the words that your instructor put on a vocabulary assignment the previous week, but you can't remember what the words were. Students were supposed to use the words in a sentence and underline them, but <u>no one</u> followed instructions, so none of the assignments have underlined vocab words.

Calling the instructor would be out of the question as this happens every other week. Tisk-tisk! You decide to write a method to read each word in a sentence and check if it could match a word in your array. Don't worry about misspellings. These assignments were done in a text editor with spell check (this was not a spelling test). Phew! 

Also, assume students only use one vocab word per sentence as the instructor was worried about misunderstandings with one word obfuscating whether students understood another word, so students followed instructions not to do that (if only this could happen for all instructions).

## Instructions (haha)

Write a method that takes an array of jumbled words and a given sentence, and checks to see if one of the words in the given sentence is one of the jumbled words in the array. The method should return the jumbled word found in the given sentence

## Bonus

Return the given sentence with asteriks around the found jumbled word.

```
jumbled_words = ["tusff",
            "ohlle",
            "rwldo",
            "ocol",
            "msuic",
            "rtuth",
            "pacm",
            "storyhi",
            "kobo",
            "kolo",
            "sten",
            "pac"]

def find_word(jumbled_words, sentence)
  # your code here
end

puts find_word(jumbled_words, "The world is round!")
# => "world"

puts find_word(jumbled_words, "I look at paintings.")
# => "look"

puts find_word(jumbled_words, "I wear a cap.")
# => "cap"

find_word(jumbled_words, "I have a lot of stuff.")
# => "stuff"

puts find_word(jumbed_words, "It is cool outside.")
# => "cool"

puts find_word(jumbled_words, "I always try to tell the truth.")
# => "truth"

puts find_word(jumbled_words, "I said hello to my friend this morning.")
# => "hello"

puts find_word(jumbled_words, "I listen to music.")
# => "music"

puts find_word(jumbled_words, "I read old about events in history.")
# => "history"

puts find_word(jumbled_words, "A book is for reading.")
# => "book"

puts find_word(jumbled_words, "I want to go to space camp.")
# => "camp"

puts find_word(jumbled_words, "The bird had a pretty nest.")
# => "nest"
```

