require_relative "byte_array.rb"
require_relative "string_metrics.rb"

# build a ByteArray for the encrypted buffer
crypted_buffer = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
crypted_byte_array = ByteArray.from_hex_buffer(crypted_buffer)

# try to XOR crypted_byte_array against ASCII characters
# this is probably not a complete set of characters...
trial_strings = (1..255).to_a.map do |key|
  StringMetrics.for(crypted_byte_array.xor_against(key))
end

# apply a cut based selection to find plausibly human readable strings
trial_strings.select! { |string| string.preselected? }

trial_strings.sort { |x, y| x.chi2 <=> y.chi2 }.shift(5).each do |candidate|
  puts "#{candidate.string}: #{candidate.chi2}"
end

