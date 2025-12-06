require_relative 'helper'

def pattern_detected(nb, division)
    return false if nb.length % division != 0
    temp = nb.length / division
    temp = nb.chars.each_slice(temp).map(&:join) # ["123", "123"]
    (temp.length - 1).times do |i|
      return false if temp[0] != temp[i + 1]
    end
    true
end

def is_valid(nb)
  (2..nb.length).to_a.each do |i|
    return false if pattern_detected(nb, i)
  end
  true
end

def function(ranges)
  result = 0

  ranges[0].split(",").each do |r|
    extremities = r.split("-")
    (extremities[0]..extremities[1]).each do |nb|
      result += nb.to_i unless is_valid(nb)
    end
  end

  result
end

input = get_input("input_day_2_test.txt")
result = function(input)
puts assert(result, 4174379265)

input = get_input("input_day_2.txt")
result = function(input)
puts assert(result, 21932258645)
