require_relative 'helper'

def function(movements)
  current_number = 50
  password = 0

  movements.each do |line|
    if line[0] == "L"
      line[1..].to_i.times do
        current_number -= 1
        current_number %= 100
        password += 1 if current_number == 0
      end
    else
      line[1..].to_i.times do
        current_number += 1
        current_number %= 100
        password += 1 if current_number == 0
      end
    end
  end

  password
end

input = get_input("input_day_1_test.txt")
result = function(input)
puts assert(result, 6)

input = get_input("input_day_1.txt")
result = function(input)
puts assert(result, 6634)
