def get_input(path)
  file = File.open(path)
  result = file.readlines.map(&:strip)
  file.close
  result
end

def assert(actual, expected)
  pass_or_fail = (actual == expected) ? "Pass" : "Fail"
  "#{actual} - #{pass_or_fail}"
end
