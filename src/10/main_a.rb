DAY_NUM = 10

def find_links(joltage_ratings)
  joltage_ratings = joltage_ratings.clone

  input_joltage = 0
  differences = []
  joltage_ratings.each do |joltage_rating|
    if joltage_rating <= input_joltage + 3
      difference = joltage_rating - input_joltage
      differences << difference
      input_joltage = joltage_rating
    else
      puts "Joltage rating too high! #{joltage_rating}"
      break
    end
  end

  # add 3 for the output to the final device
  differences << 3
  differences
end

def run
  input = get_input(DAY_NUM)
  joltage_ratings = input.map(&:to_i).sort
  differences = find_links(joltage_ratings)
  puts "Differences: #{differences}"
  diff1 = differences.select { |x| x == 1 }.length
  diff3 = differences.select { |x| x == 3 }.length
  puts "Multiple #{diff1} by #{diff3} to get #{diff1 * diff3}"
end
