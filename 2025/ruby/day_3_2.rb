require_relative 'helper'

def update(current_digit, final_digits, nb_of_digit)
  result = Array.new(nb_of_digit) { |i| 0 }

  puts "#### #{final_digits} << #{current_digit}"

  result
end

def highest_combination(line, nb_of_digit)
    # final_digits = Array.new(nb_of_digit) { |i| 0 }

    # line.split("").each_with_index do |current_digit_s, i|
    #   current_digit = current_digit_s.to_i

    #   if i >= nb_of_digit
    #     final_digits = update(current_digit, final_digits, nb_of_digit)
    #   else
    #     final_digits[i] = current_digit
    #   end
    # end

    # result = ""
    # final_digits.each { |d| result += d.to_s }
    # result.to_i
    #
    current_i = 9
    attempt = ""
    while current_i >= 0
      attempt = ""
      line.split("").each_with_index do |current_digit_s, i|
        current_digit = current_digit_s.to_i

        attempt << current_digit_s if current_digit >= current_i
      end
      current_i -= 1
      break if attempt.length >= 3
    end

    current_i = 9

    while current_i >= 0

      attempt.each_with_index do |current_digit_s, i|
        current_digit = current_digit_s.to_i

        attempt << current_digit_s if current_digit >= current_i
      end

      current_i -= 1
    end

    attempt
end

def function(ranges)
  result = 0
  ranges.each do |r|
    result += highest_combination(r)
  end
  result
end

puts highest_combination("81161696", 3) # == 896

# input = get_input("input_day_3_test.txt")
# result = function(input)
# puts assert(result, 3121910778619)

# input = get_input("input_day_3.txt")
# result = function(input)
# puts assert(result, 0)
