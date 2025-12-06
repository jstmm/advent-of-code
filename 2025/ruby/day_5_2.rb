require_relative 'helper'

def merge(range, new_ranges)
  new_ranges
end

def function(table)
  fresh_ingredient_ranges = []
  result = 0

  table.each_with_index do |line, i|
    break if line == ""
    fresh_ingredient_ranges << {
      start: line.split("-")[0].to_i,
      end: line.split("-")[1].to_i
    }
  end

  new_ranges = []
  fresh_ingredient_ranges.each do |r|
    if new_ranges.empty?
      new_ranges << { start: r[:start], end: r[:end] }
      next
    end
    new_ranges = merge(r, new_ranges)
  end

  puts "new_ranges = #{new_ranges.inspect}"
  new_ranges.each do |r|
    result += (r[:end] - r[:start] + 1)
  end
  result
end

input = get_input("input_day_5_test.txt")
result = function(input)
puts assert(result, 14)

# input = get_input("input_day_5.txt")
# result = function(input)
# puts assert(result, 674)
