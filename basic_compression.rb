require 'pry'

class BasicCompression
  def build_compressed_string(input_str)
    output = ''
    pointer = 0
    
    while(pointer < input_str.length) do
      if(input_str[pointer] == input_str[pointer + 1])
        compressed_sequence = read_string_sequence(input_str[pointer..input_str.length])
        output += compressed_sequence[0]
        pointer += compressed_sequence[1]
      else
        output += input_str[pointer]
        pointer += 1
      end
    end
    output
  end

  def read_string_sequence(repeating_string)
    count = 1

    while(count < repeating_string.length && repeating_string[count - 1] == repeating_string[count]) do
      count += 1
    end
    ["#{repeating_string[0]}#{count}", count]
  end
end


# Simple test sequences
basic = BasicCompression.new
p basic.build_compressed_string('abcdefg') == 'abcdefg';
p basic.build_compressed_string('abbcccdddd') == 'ab2c3d4';
p basic.build_compressed_string('abcaaabbb') == 'abca3b3';
p basic.build_compressed_string('aaabaaaaccaaaaba') == 'a3ba4c2a4ba';

