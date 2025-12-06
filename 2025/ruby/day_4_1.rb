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
  result += 1 if x > min_x && y > min_y && is_occupied(table[y - 1][x - 1])
  result += 1 if y > min_y && is_occupied(table[y - 1][x])
  result += 1 if x < max_x && y > min_y && is_occupied(table[y - 1][x + 1])
  result += 1 if x > min_x && is_occupied(table[y][x - 1])
  result += 1 if x < max_x && is_occupied(table[y][x + 1])
  result += 1 if x > min_x && y < max_y && is_occupied(table[y + 1][x - 1])
  result += 1 if y < max_y && is_occupied(table[y + 1][x])
  result += 1 if x < max_x && y < max_y && is_occupied(table[y + 1][x + 1])
  result < 4
end

def function(table)
  x = 0
  y = 0
  result = 0
  table.each do |line|
    line.split("").each do |cell|
      result += 1 if can_be_accessed(x, y, table)
      x += 1
    end
    x = 0
    y += 1
  end

  result
end

input = get_input("input_day_4_test.txt")
result = function(input)
puts assert(result, 13)

input = get_input("input_day_4.txt")
result = function(input)
puts assert(result, 1372)
