require_relative 'challenge2'

crypted = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

bytes = hex_string_to_byte_array(crypted)

CharacterPair = Struct.new(:byte, :count)

def most_frequent_characters(bytes)
  hist = Hash.new(0).tap { |result| bytes.each { |byte| result[byte] += 1 }}

  array_of_character_pairs = [].tap do |result|
    hist.each_key { |key| result << CharacterPair.new(key, hist[key]) }
  end

  array_of_character_pairs.sort { |e| e.count }
end

