require_relative 'helper'

def is_occupied(value)
  value == "@"
end

def can_be_accessed(x, y, table)
  return false if table[y][x] == '.'
  min_x = 0
  max_x = table.first.length - 1
  min_y = 0
  max_y = table.length - 1
  result = 0
  result += 1 if x > min_x && y > min_y &&  is_occupied(table[y - 1][x - 1])
  result += 1 if y > min_y &&               is_occupied(table[y - 1][x])
  result += 1 if x < max_x && y > min_y &&  is_occupied(table[y - 1][x + 1])
  result += 1 if x > min_x &&               is_occupied(table[y][x - 1])
  result += 1 if x < max_x &&               is_occupied(table[y][x + 1])
  result += 1 if x > min_x && y < max_y &&  is_occupied(table[y + 1][x - 1])
  result += 1 if y < max_y &&               is_occupied(table[y + 1][x])
  result += 1 if x < max_x && y < max_y &&  is_occupied(table[y + 1][x + 1])
  result < 4
end

def function(table)
  result = 0
  while true do
    to_remove = []
    table.each_with_index do |line, y|
      line.split("").each_with_index do |cell, x|
        if can_be_accessed(x, y, table)
          to_remove << { x: x, y: y }
          result += 1
        end
      end
    end
    break if to_remove.length == 0
    to_remove.each do |location|
      table[location[:y]][location[:x]] = '.'
    end
  end
  result
end

input = get_input("input_day_4_test.txt")
result = function(input)
puts assert(result, 43)

input = get_input("input_day_4.txt")
result = function(input)
puts assert(result, 7922)
