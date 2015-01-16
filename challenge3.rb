require_relative 'challenge2'

CharacterPair = Struct.new(:byte, :count)

def most_frequent_characters(bytes)
  hist = Hash.new(0).tap { |result| bytes.each { |byte| result[byte] += 1 }}

  array_of_character_pairs = [].tap do |result|
    hist.each_key { |key| result << CharacterPair.new(key, hist[key]) }
  end

  array_of_character_pairs.sort { |a,b| b.count <=> a.count }
end

def xor_char_for_letter(encoded_letter_byte, letter_of_interest)
  characters = ("0"..."z").to_a

  characters.select {|char| (char.bytes.first ^ encoded_letter_byte) == letter_of_interest.bytes.first}.first
end

crypted = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

bytes = hex_string_to_byte_array(crypted)

top_3 = most_frequent_characters(bytes).slice(0..2)

possible_encodings = top_3.map {|pair| xor_char_for_letter(pair.byte, "e")}.reject(&:nil?)

possible_encodings.each do |key|
  key_byte_array = hex_string_to_byte_array(key.bytes.first.to_s(16) * crypted.length)
  puts byte_array_to_hex_string(xor_equal_byte_buffers(crypted, key_byte_array))
end
