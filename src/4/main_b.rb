require 'dry/validation'

DAY_NUM = 4

VALID_EYE_COLORS = %w[amb blu brn gry grn hzl oth].freeze

class PassportSchema < Dry::Validation::Contract
  params do
    required(:byr).filled(:integer, gteq?: 1920, lteq?: 2002)
    required(:iyr).filled(:integer, gteq?: 2010, lteq?: 2020)
    required(:eyr).filled(:integer, gteq?: 2020, lteq?: 2030)
    required(:hgt).filled(:string)
    required(:hcl).filled(:string, format?: /#[abcdef\d]{6}/)
    required(:ecl).filled(:string).filled(included_in?: VALID_EYE_COLORS)
    required(:pid).filled(:string, format?: /(\d){9}/)
  end

  rule(:hgt) do
    number = value[/\d+/].to_i
    unit = value[/\D+/]

    unless %w[cm in].include?(unit)
      key.failure('unit must be cm or in')
    end

    if unit == 'cm'
      if number < 150 || number > 193
        key.failure('centimeters must be between 150 and 193')
      end
    end

    if unit == 'in'
      if number < 59 || number > 76
        key.failure('inches must be between 59 and 76')
      end
    end
  end
end

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
      if %w[byr iyr eyr].include?(key)
        value = value.to_i
      end
      running_passport[key] = value
    end
  end

  passports << running_passport if running_passport != {}
  passports
end

def valid_passport?(passport)
  schema = PassportSchema.new
  puts "passport: #{passport}"
  result = schema.call(passport)
  puts "Results: #{result.errors.to_h}"
  result.success?
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
