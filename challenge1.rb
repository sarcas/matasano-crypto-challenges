require "base64"

def hex_string_to_byte_array(hex_string)
  hex_string.scan(/../).map {|byte| byte.hex}
end

def byte_array_to_base64(bytes)
  Base64.strict_encode64(bytes.map {|byte| byte.chr}.join)
end

#bytes = hex_string_to_byte_array("49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")
#puts byte_array_to_base64(bytes)
#"SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t" #base64
