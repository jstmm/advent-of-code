require_relative 'helper'

def added(o)
  result = 0
  o.each {|x| result += x.to_i }
  result
end

def multiplied(o)
  result = 0
  o.each do |x|
    if result == 0
      result = x.to_i
    else
      result *= x.to_i
    end
  end
  result
end

def function(table)
  result = 0
  operations = []
  table.each do |line|
    line.split.each_with_index do |c, i|
      operations[i] ||= []
      operations[i] << c
    end
  end

  operations.each do |o|
    case o.last
    when '+'
      result += added(o[0..table.length - 2])
    when '*'
      result += multiplied(o[0..table.length - 2])
    end
  end

  result
end

input = get_input("input_day_6_test.txt")
result = function(input)
puts assert(result, 4277556)

input = get_input("input_day_6.txt")
result = function(input)
puts assert(result, 0)
