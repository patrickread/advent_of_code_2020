require_relative '../util/helpers'

DAY_NUM = 3

SLOPES = [
  # RIGHT, DOWN
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
]

def tree?(character)
  character == '#'
end

def traverse_slope(hill_lines, slope_right, slope_down)
  trees = 0
  current_x = 0
  current_y = 0

  while hill_lines.length > current_y
    current_line = hill_lines[current_y]
    line_length = current_line.length
    tree_found = tree?(current_line[current_x % line_length])
    trees += tree_found ? 1 : 0

    current_x += slope_right
    current_y += slope_down
  end

  trees
end

def traverse_slopes(hill_lines, slopes)
  slopes.map do |slope|
    traverse_slope(hill_lines, slope[0], slope[1])
  end
end

def run
  input = get_input(DAY_NUM)
  results = traverse_slopes(input, SLOPES)
  multiplied = results.reduce(&:*)
  puts "Multiplied Results: #{multiplied}"
end
