# Public: Class to compute some useful metrics for a string
#
# Examples:
# StringMetrics.new("Apple").character_frequency
# => {:a=>0.2, ... }
class StringMetrics
  # The frequency of characters in English text from:
  # http://en.algoritmy.net/article/40379/Letter-frequency-English
  EN_CHAR_FREQ = {
    :a => 0.08167,
    :b => 0.01492,
    :c => 0.02782,
    :d => 0.04253,
    :e => 0.12702,
    :f => 0.02228,
    :g => 0.02015,
    :h => 0.06094,
    :i => 0.06966,
    :j => 0.00153,
    :k => 0.00772,
    :l => 0.04025,
    :m => 0.02406,
    :n => 0.06749,
    :o => 0.07507,
    :p => 0.01929,
    :q => 0.00095,
    :r => 0.05987,
    :s => 0.06327,
    :t => 0.09056,
    :u => 0.02758,
    :v => 0.00978,
    :w => 0.02360,
    :x => 0.00150,
    :y => 0.01974,
    :z => 0.00074
  }

  attr_reader :string

  # Public: Build a StringMetrics object from a ByteArray
  #
  # byte_array - ByteArray object
  #
  # Returns StringMetrics object
  def self.for(byte_array)
    new(byte_array.to_s)
  end

  # Public: Initialize a new StringMetrics object from a String
  #
  # string - String object
  def initialize(string)
    @string = string
  end

  # Public: Apply a basic cut based preselection to the string, requiring that
  # the fraction of characters that are word characters (excluding spaces) is
  # no more than 30% of the string
  #
  # Returns Bool
  def preselected?
    nonword_fraction_excluding_spaces < 0.3
  end

  # Public: Calculate the chi2 of the string relative character frequency
  # compared to the expected relative character frequency for English text
  #
  # Returns Float
  def chi2
    relative_char_freq.map do |char, char_freq|
      (char_freq - EN_CHAR_FREQ[char])**2 / EN_CHAR_FREQ[char]
    end.reduce(:+)
  end

  private

  # Internal: Compute the non word character fraction (excluding spaces)
  #
  # Returns Float
  def nonword_fraction_excluding_spaces
    @nonword_fraction_excluding_spaces ||= fraction(/\W/) - fraction(/\s/)
  end

  # Internal: Compute the relative character frequency histogram
  #
  # Returns Hash
  def relative_char_freq
    @relative_char_freq ||= Hash.new(0).tap do |hash|
      EN_CHAR_FREQ.each_key do |char|
        hash[char] = fraction(/#{char}/i)
      end
    end
  end

  # Internal: Compute the relative frequency of individual characters
  #
  # regexp - Regexp e.g. \w for word characters
  #
  # Returns Float
  def fraction(regexp)
    char_array.count { |char| char =~ regexp } / char_array.length.to_f
  end

  # Internal: Get the string as an Array of characters
  #
  # Returns Array of single character Strings
  def char_array
    @character_array ||= string.scan(/./)
  end
end

