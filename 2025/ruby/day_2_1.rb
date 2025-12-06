require_relative 'helper'

def is_valid(nb)
  return true if (nb.length % 2 != 0)
  new_l = nb.length / 2
  return false if nb[0..new_l - 1] == nb[new_l..nb.length - 1]
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
puts assert(result, 1227775554)

input = get_input("input_day_2.txt")
result = function(input)
puts assert(result, 19128774598)
