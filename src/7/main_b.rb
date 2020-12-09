DAY_NUM = 7

def get_rule_parts(rule)
  rule
    .split(/bags|bag/)
    .map { |x| x.gsub('contain ', '').gsub(/\,|\./, '') }
    .map(&:strip)
    .reject(&:empty?)
end

def parse_rule(rule)
  rule_parts = get_rule_parts(rule)

  contents = rule_parts[1..]
  child_colors = contents.map do |quantity_and_color|
    {
      quantity: quantity_and_color[/\d+/].to_i,
      color: quantity_and_color[/\D+/].strip
    }
  end

  {
    parent_color: rule_parts[0],
    child_colors: child_colors
  }
end

def parse_rules(rules)
  rules.map do |rule|
    parse_rule(rule)
  end
end

def find_parent_color_instances(child_color, rules)
  rules.select do |rule|
    rule[:child_colors].any?{ |child| child[:color] == child_color }
  end
end

def find_color_rule(parent_color, rules)
  rules.find do |rule|
    rule[:parent_color] == parent_color
  end
end

def find_parent_bags(target_color, rules)
  parents_of_target = []
  parent_color_instances = find_parent_color_instances(target_color, rules)
  parents_of_target.concat(parent_color_instances)

  parents = parent_color_instances.map do |parent_color_instance|
    # Don't need to search ones that are already found
    find_parent_bags(parent_color_instance[:parent_color], rules - parent_color_instances)
  end

  parents_of_target.concat(parents.flatten)
  parents_of_target
end

# def find_child_bags(parent_color, rules, quantity = 1)
#   color_rule = find_color_rule(parent_color, rules)
#   return (quantity.zero? ? 1 : 0) if !color_rule
#   puts "parent_color: #{color_rule}; quantity: #{quantity}"

#   quantities = color_rule[:child_colors].map do |color_hash|
#     puts "color: #{color_hash[:color]}; quantity: #{color_hash[:quantity]}"
#     all_child_quantities = find_child_bags(color_hash[:color], rules - [color_rule], color_hash[:quantity])
#     quantity * (all_child_quantities.zero? ? 1 : 0)
#   end

#   puts "parent_color: #{color_rule}; all child quantities: #{quantities}"

#   quantities.reduce(:+)
# end

def find_child_quantity(parent_color, rules, parent_quantity = 0)
  color_rule = find_color_rule(parent_color, rules)
  return parent_quantity if color_rule.nil?

  returning = color_rule[:child_colors].map do |child_color|
    if child_color[:quantity].zero?
      0
    else
      find_child_quantity(
        child_color[:color],
        rules,
        (parent_quantity.zero? ? 1 : parent_quantity) * child_color[:quantity]
      )
    end
  end.reduce(:+) + parent_quantity
  returning
end

def find_child_count(parent_color, rules)
  total_quantity = find_child_quantity(parent_color, rules)
  puts "#{total_quantity} required inside a #{parent_color} bag!"
  total_quantity
end

def run
  all_rules = get_input(DAY_NUM)
  parsed_rules = parse_rules(all_rules)
  target_color = 'shiny gold'
  find_child_count(target_color, parsed_rules)
end
