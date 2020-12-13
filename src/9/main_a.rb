DAY_NUM = 9

def valid_number?(number, previous_numbers)
  puts "Validating number #{number}"
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
      break
    else
      puts "Valid number! #{number}"
    end

    index += 1
  end
end

def run
  all_numbers = get_input(DAY_NUM)
  all_numbers = all_numbers.map(&:to_i)
  validate_numbers(all_numbers)
end

