require_relative '../../src/7/main_b'

describe 'find_child_count' do
  let(:rules_string) do
    'shiny gold bags contain 2 dark red bags.
    dark red bags contain 2 dark orange bags.
    dark orange bags contain 2 dark yellow bags.
    dark yellow bags contain 2 dark green bags.
    dark green bags contain 2 dark blue bags, 2 dim gray bags.
    dim gray bags contain no other bags.
    dark blue bags contain 2 dark violet bags.
    dark violet bags contain no other bags.'
  end

  let(:parsed_rules) do
    all_rules = rules_string.split("\n").map(&:strip)
    puts "all_rules: #{all_rules}"
    parse_rules(all_rules)
  end

  let(:color) do
    'shiny gold'
  end

  it 'returns correctly for a known value' do
    expect(find_child_count(color, parsed_rules)).to eq(158)
  end
end

describe 'parse_rule' do
  let(:rule_string) do
    'shiny gold bags contain 2 dark red bags.'
  end

  it 'returns correctly' do
    expect(parse_rule(rule_string)).to eq({
      :parent_color=>"shiny gold",
      :child_colors=>[{:color=>"dark red", :quantity=>2}]
    })
  end
end
