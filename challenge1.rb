require_relative "hex_string.rb"

hex_string = HexString.new("49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")
puts hex_string.to_a.join(", ")
puts hex_string.to_s
puts hex_string.to_base64

