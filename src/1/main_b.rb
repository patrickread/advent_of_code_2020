require_relative '../util/helpers'

# Input is an array of strings
def find_factors_and_multiply(input, target = 2020)
  input = input.map(&:to_i)
  results = []
  input.each_with_index do |a, index_a|
    input.each_with_index do |b, index_b|
      if a + b > target
        next
      end

      input.each_with_index do |c, index_c|
        next if [index_a, index_b, index_c].uniq.length != 3
        puts "Examining #{a}, #{b}, and #{c}"

        option = [a, b, c]
        if option.reduce(:+) == target
          results = option
          puts "Found results #{results}"
          break
        end
      end

      if results.length > 0
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

def start
  day_num = 1
  input = get_input(day_num)
  find_factors_and_multiply(input)
end
