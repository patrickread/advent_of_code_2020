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

def find_unique_parents(target_color, rules)
  all_parents = find_parent_bags(target_color, rules)
  all_parents.uniq!{ |x| x[:parent_color] }
  puts "#{all_parents.length} parents of #{target_color} found!"
end

def run
  all_rules = get_input(DAY_NUM)
  parsed_rules = parse_rules(all_rules)
  target_color = 'shiny gold'
  find_unique_parents(target_color, parsed_rules)
end
