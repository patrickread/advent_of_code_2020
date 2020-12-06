require_relative '../util/helpers'

DAY_NUM = 3
RIGHT = 3
DOWN = 1

def is_tree?(character)
  character == '#'
end

def traverse_slope(hill_lines)
  trees = 0
  current_x = 0
  current_y = 0

  while hill_lines.length > current_y
    current_line = hill_lines[current_y]
    line_length = current_line.length
    tree_found = is_tree?(current_line[current_x % line_length])
    trees += tree_found ? 1 : 0

    current_x += RIGHT
    current_y += DOWN
  end

  trees
end

def run
  input = get_input(DAY_NUM)
  num_trees = traverse_slope(input)
  puts "Trees encountered: #{num_trees}"
end
