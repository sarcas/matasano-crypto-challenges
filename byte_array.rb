require "base64"

# Public: Class to represent an array of bytes
#
# Examples:
#   ByteArray.from_hex_buffer("48656c6c6f").to_s
#   => "Hello"
class ByteArray
  attr_reader :raw_array

  # Public: Build a ByteArray from a hex buffer
  #
  # hex_buffer - String of hexadecimal digits
  #
  # Returns ByteArray
  def self.from_hex_buffer(hex_buffer)
    new(hex_buffer.scan(/../).map(&:hex))
  end

  # Public: Initialize a new ByteArray
  #
  # raw_array - Array of Fixnum
  def initialize(raw_array)
    @raw_array = raw_array
  end

  # Public: Convert to a String of characters
  #
  # Returns String
  def to_s
    raw_array.map(&:chr).join
  end

  # Public: Convert to a String of hexadecimal digits
  #
  # Returns String
  def to_hex_buffer
    raw_array.map { |byte| byte.to_s(16) }.join
  end

  # Public: Convert to a string of base-64 digits
  #
  # Retruns String
  def to_base64
    @base64 ||= Base64.strict_encode64(self.to_s)
  end

  # Public: XOR against another ByteArray
  #
  # rhs - ByteArray on the right hand side
  #
  # Returns ByteArray
  def ^(rhs)
    res = [].tap do |result|
      self.raw_array.each_index do |i|
        result << (self.raw_array[i] ^ rhs.raw_array[i])
      end
    end

    ByteArray.new(res)
  end
end

