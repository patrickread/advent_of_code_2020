require_relative '../util/helpers'

def parse_data(input)
  delimiter = ': '

  input.map do |line|
    rule, password = line.split(delimiter)
    numbers, letter = rule.split(' ')
    low_num, high_num = numbers.split('-').map(&:to_i)

    {
      positions: [low_num, high_num],
      letter: letter,
      password: password
    }
  end
end

def check_rules(rule_and_passwords)
  rule_and_passwords.map { |rule_and_password|
    check_rule(rule_and_password)
  }.map { |x| x ? 1 : 0 }.reduce(:+)
end

def check_rule(rule_and_password)
  letters = rule_and_password[:password].scan(/\w/)
  the_count = rule_and_password[:positions].count do |position|
    letters[position - 1] == rule_and_password[:letter]
  end
  the_count == 1
end

def start
  day_num = 2
  input = get_input(day_num)
  rule_and_passwords = parse_data(input)
  num_valid = check_rules(rule_and_passwords)
  puts "Number valid: #{num_valid}"
end
