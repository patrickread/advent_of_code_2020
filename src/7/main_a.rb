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
  results = rules.map do |rule|
    parse_rule(rule)
  end
end

def run
  all_rules = get_input(DAY_NUM)
  parse_rules(all_rules)
end
