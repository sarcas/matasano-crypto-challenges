require_relative 'challenge1.rb'

def byte_array_to_hex_string(bytes)
  bytes.map {|byte| byte.to_s(16)}.join
end

def xor_equal_byte_buffers(buffer1, buffer2)
  [].tap do |result|
    buffer1.each_index do |idx|
      result << (buffer1[idx] ^ buffer2[idx])
    end
  end
end

buffer1 = hex_string_to_byte_array("1c0111001f010100061a024b53535009181c")
buffer2 = hex_string_to_byte_array("686974207468652062756c6c277320657965")

xor_ed_buffer = xor_equal_byte_buffers(buffer1,buffer2)

p byte_array_to_hex_string xor_ed_buffer


