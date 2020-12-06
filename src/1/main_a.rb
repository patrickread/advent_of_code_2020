require_relative '../util/helpers'

# Input is an array of strings
def find_factors_and_multiply(input, target = 2020)
  input = input.map(&:to_i)
  results = []
  input.each do |input_1|
    input.each do |input_2|
      next if input_1 == input_2
      puts "Comparing #{input_1} and #{input_2}"

      if input_1 + input_2 == target
        results = [input_1, input_2]
        puts "Found results #{results}"
        break
      end
    end

    if results.length > 0
      break
    end
  end

  multiplied = results.reduce(&:*)
  puts "Multiplied: #{multiplied}"
  multiplied
end

def run
  day_num = 1
  input = get_input(day_num)
  find_factors_and_multiply(input)
end
