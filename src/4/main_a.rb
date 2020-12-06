DAY_NUM = 4

FIELDS_REQUIRED = %w[byr iyr eyr hgt hcl ecl pid].freeze

def separate_passports(input_lines)
  passports = []
  running_passport = {}
  input_lines.each do |line|
    if line == ''
      passports << running_passport
      running_passport = {}
      next
    end

    property_sections = line.split(' ')
    property_sections.each do |prop_sect|
      key, value = prop_sect.split(':')
      running_passport[key] = value
    end
  end

  passports << running_passport if running_passport != {}
  passports
end

def valid_passport?(passport)
  FIELDS_REQUIRED.all? { |field| passport.key? field }
end

def num_valid_passports(passports)
  passports.count do |passport|
    valid_passport?(passport)
  end
end

def run
  input = get_input(DAY_NUM)
  passports = separate_passports(input)
  count_valid = num_valid_passports(passports)
  puts "Number of valid passports: #{count_valid}"
end
