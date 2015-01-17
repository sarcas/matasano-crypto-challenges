require_relative "byte_array.rb"

buffer = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
byte_array = ByteArray.from_hex_buffer(buffer)

puts byte_array.raw_array.join(",")
puts byte_array.to_s
puts byte_array.to_base64

