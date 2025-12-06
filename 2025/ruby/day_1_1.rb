require_relative 'helper'

def function(movements)
  current_number = 50
  password = 0

  movements.each do |line|
    nb = line[1..].to_i
    if line[0] == "L"
      current_number -= nb
    else
      current_number += nb
    end
    current_number %= 100
    password += 1 if current_number == 0
  end

  password
end

input = get_input("input_day_1_test.txt")
result = function(input)
puts assert(result, 3)

input = get_input("input_day_1.txt")
result = function(input)
puts assert(result, 1141)
