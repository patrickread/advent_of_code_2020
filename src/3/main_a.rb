require_relative '../util/helpers'

DAY_NUM = 3
RIGHT = 3
DOWN = 1

def traverse_slope(hill_lines)
  0
end

def run
  input = get_input(DAY_NUM)
  num_trees = traverse_slope(input)
  puts "Tree encountered: #{num_trees}"
end
