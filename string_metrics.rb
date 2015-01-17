class StringMetrics
  VOWELS = /a|e|i|o|u/i

  attr_reader :string

  def self.for(byte_array)
    new(byte_array.to_s)
  end

  def initialize(string)
    @string = string
  end

  def to_s
    features.map { |feature| feature.round(2) }.join(", ")
  end

  def features
    [word_fraction, vowel_fraction]
  end

  def cuts_pass?
    vowel_fraction > 0.2 && word_fraction > 0.7
  end

  def vowel_fraction
    @vowel_fraction ||= fraction(VOWELS)
  end

  def word_fraction
    @word_fraction ||= fraction(/\w/)
  end

  private

  def fraction(regexp)
    char_array.count { |char| char =~ regexp } / char_array.length.to_f
  end

  def char_array
    @character_array ||= string.scan(/./)
  end
end

