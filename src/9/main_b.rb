DAY_NUM = 9

def valid_number?(number, previous_numbers)
  previous_numbers.each_with_index do |number_i, index|
    previous_numbers[index+1..-1].each do |number_j|
      next if number_i == number_j

      if number_i + number_j == number
        return true
      end
    end
  end

  false
end

def validate_numbers(numbers)
  index = 25
  while index < numbers.length
    number = numbers[index]
    if !valid_number?(number, numbers[index - 25, 25])
      puts "Invalid number #{number}"
      return number
    end

    index += 1
  end

  'none'
end

def find_set(numbers, invalid_number)
  set = []
  index = 0
  search_index = index
  while index < numbers.length
    set_item = numbers[index]
    total = (set + [set_item]).reduce(:+)
    return (set + [set_item]) if total == invalid_number

    if total > invalid_number
      index = search_index + 2
      search_index += 1
      set = [numbers[search_index]]
    else
      set << set_item
      index += 1
    end
  end
end

def run
  all_numbers = get_input(DAY_NUM)
  all_numbers = all_numbers.map(&:to_i)
  invalid_number = validate_numbers(all_numbers)
  found_set = find_set(all_numbers, invalid_number)
  puts "Found set: #{found_set}"
  puts "Found set min: #{found_set.min}"
  puts "Found set max: #{found_set.max}"
end

