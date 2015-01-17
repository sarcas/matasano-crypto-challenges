require_relative "byte_array.rb"

byte_array1 = ByteArray.from_hex_buffer("1c0111001f010100061a024b53535009181c")
byte_array2 = ByteArray.from_hex_buffer("686974207468652062756c6c277320657965")

xor = byte_array1 ^ byte_array2
puts xor.to_hex_buffer
puts xor.to_s

