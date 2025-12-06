require_relative 'helper'

def highest_combination(line, nb_of_digit)
  final_digits = Array.new(nb_of_digit) { |i| 0 }

  line.split("").each_with_index do |n, i|
    current_digit = n.to_i

    if current_digit > final_digits[0] && i != line.length - 1
      final_digits[0] = current_digit
      final_digits[1] = 0
    elsif current_digit > final_digits[1]
      final_digits[1] = current_digit
    end
  end

  result = ""
  final_digits.each { |d| result += d.to_s }
  result.to_i
end

def function(ranges)
  result = 0
  ranges.each do |r|
    result += highest_combination(r, 2)
  end
  result
end

input = get_input("input_day_3_test.txt")
result = function(input)
puts assert(result, 357)

input = get_input("input_day_3.txt")
result = function(input)
puts assert(result, 17405)
