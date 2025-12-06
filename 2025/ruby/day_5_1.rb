require_relative 'helper'

def is_fresh(ing, fresh_ingredient_ranges)
  fresh_ingredient_ranges.each do |r|
    return true if r[:start] <= ing && ing <= r[:end]
  end
  return false
end

def function(table)
  temp = true
  fresh_ingredient_ranges = []
  ingredients = []
  result = 0

  table.each_with_index do |line, i|
    if line == ""
      temp = false
      next
    end
    if temp
      fresh_ingredient_ranges << { start: line.split("-")[0].to_i, end: line.split("-")[1].to_i }
    else
      ingredients << line.to_i
    end
  end

  ingredients.each do |ing|
    result += 1 if is_fresh(ing, fresh_ingredient_ranges)
  end

  result
end

input = get_input("input_day_5_test.txt")
result = function(input)
puts assert(result, 3)

input = get_input("input_day_5.txt")
result = function(input)
puts assert(result, 674)
