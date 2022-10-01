require 'pry-byebug'

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(string, dictionary_array)
  string_words = string.downcase.split

  matches = {}

  dictionary_array.each do |dict_word|
    string_words.each do |string_word|
      if string_word.include? dict_word
        if matches[dict_word]
          matches[dict_word] += 1
        else
          matches[dict_word] = 1
        end
      end
    end
  end
  matches
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)

# convert to downcase
# check every word in dictionary to see if the input string include? dict_word
# if the dictionary word is included, add it to the hash as a key and increment the value
# If they already exists, just add the value
