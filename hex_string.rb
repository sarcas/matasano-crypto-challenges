require "base64"

# Public: Class to represent a String of hexadecimal digits
#
# Examples:
#   HexString.new("48656c6c6f").to_s
#   => "Hello"
class HexString
  attr_reader :raw_string

  # Public: Initialize a new HexString from a raw string of hexadecimal digits
  #
  # raw_string - String
  def initialize(raw_string)
    @raw_string = raw_string
  end

  # Public: Convert each hexadecimal digit to a character and return as String
  #
  # Returns String
  def to_s
    to_a.map(&:chr).join
  end

  # Public: Convert each hexadecimal digit to base-10 and return as Array
  #
  # Returns Array
  def to_a
    raw_string.scan(/../).map(&:hex)
  end

  # Public: Convert the internally represented String of characters to
  # a String of base-64 digits representing the characters
  #
  # Retruns String
  def to_base64
    Base64.strict_encode64(to_s)
  end
end

