require 'pry-byebug'

## normalizes character.ord to a-z = 1-26, using different adjust value for up and downcase characters. Then adds the offset to shift the characters, wraps the value with modulo, adds the adjustment number and gives the final character.
def get_new_character_encode(character,offset, adjust)
    new_char = character.ord + offset - adjust
    new_char_adjusted = new_char%26
    new_char_adjusted_value = new_char_adjusted+adjust
    new_char_adjusted_value.chr 
end

## algo for decoding message
def get_new_character_decode(character,offset, adjust)
    new_char = character.ord - offset - adjust
    new_char_adjusted = new_char%26
    new_char_adjusted_value = new_char_adjusted+adjust
    new_char_adjusted_value.chr 
end


def caesar_encode(string, offset)
  new_string = string.split("").map do |character|
    if character.ord > 64 && character.ord < 91
      get_new_character_encode(character,offset,64)
    elsif character.ord > 96 && character.ord < 122
      get_new_character_encode(character,offset,96)
    else 
      character
    end
  end
end

def caesar_decode(string, offset)
    new_string = string.split("").map do |character|
      if character.ord > 64 && character.ord < 91
        get_new_character_decode(character,offset,64)
      elsif character.ord > 96 && character.ord < 122
        get_new_character_decode(character,offset,96)
      else 
        character
      end
    end
  end

encoded_message = caesar_encode('What a string!', 5).join("")

puts encoded_message

decoded_message = caesar_decode(encoded_message,5).join("")

puts decoded_message