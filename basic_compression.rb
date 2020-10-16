# frozen_string_literal: true

class BasicCompression
  def build_compressed_string(input_str)
    output = ''
    pointer = 0

    while pointer < input_str.length
      result = if input_str[pointer] == input_str[pointer + 1]
                 read_string_sequence(input_str[pointer..input_str.length])
               else
                 [input_str[pointer], 1]
               end
      output += result[0]
      pointer += result[1]
    end
    output
  end

  def read_string_sequence(repeating_string)
    count = 1

    count += 1 while repeating_string[count - 1] == repeating_string[count]
    ["#{repeating_string[0]}#{count}", count]
  end
end

# Simple test sequences, uncomment to run
basic = BasicCompression.new
p basic.build_compressed_string('abcdefg') == 'abcdefg'
p basic.build_compressed_string('abbcccdddd') == 'ab2c3d4'
p basic.build_compressed_string('abcaaabbb') == 'abca3b3'
p basic.build_compressed_string('aaabaaaaccaaaaba') == 'a3ba4c2a4ba'
