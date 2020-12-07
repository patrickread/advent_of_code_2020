DAY_NUM = 6

def separate_groupings(input_lines)
  groupings = []
  grouping = []
  input_lines.each do |line|
    if line == ''
      unless grouping.empty?
        groupings << grouping
        grouping = []
      end
      next
    end

    grouping << line
  end

  groupings << grouping unless grouping.empty?
  groupings
end

def get_unique_yeses(grouping)
  smashed = grouping.join
  smashed.scan(/\w/).uniq.length
end

def get_sums_of_yeses(groupings)
  groupings.map { |grouping|
    get_unique_yeses(grouping)
  }.reduce(:+)
end

def run
  input = get_input(DAY_NUM)
  groupings = separate_groupings(input)
  sum = get_sums_of_yeses(groupings)
  puts "Sum of unique yeses for all groups: #{sum}"
end
