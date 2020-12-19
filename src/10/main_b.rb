DAY_NUM = 10

def find_next_links(remaining_joltage_ratings, input_joltage: 0)
  remaining_joltage_ratings = remaining_joltage_ratings.clone

  differences = []
  joltage_rating = remaining_joltage_ratings[0]
  puts "next joltage: #{joltage_rating}"
  if joltage_rating <= input_joltage + 3
    difference = joltage_rating - input_joltage
    differences << difference
    if remaining_joltage_ratings.length > 1
      differences += find_next_links(remaining_joltage_ratings[1..], input_joltage: joltage_rating)
    end
  else
    puts "Joltage rating too high! #{joltage_rating}"
  end

  differences
end

def run
  input = get_input(DAY_NUM)
  joltage_ratings = input.map(&:to_i).sort
  differences = find_next_links(joltage_ratings)
  # add 3 for the output to the final device
  differences << 3
  puts "Differences: #{differences}"
  diff1 = differences.select { |x| x == 1 }.length
  diff3 = differences.select { |x| x == 3 }.length
  puts "Multiple #{diff1} by #{diff3} to get #{diff1 * diff3}"
end
