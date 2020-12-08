require_relative '../../src/7/main_a'

describe 'parse_rule' do
  let(:rule) do
    'light orange bags contain 1 dark maroon bag, 3 dim maroon bags, 5 striped green bags, 2 pale aqua bags.'
  end

  it 'returns correctly for a known value' do
    expect(parse_rule(rule)).to eq({
      parent_color: 'light orange',
      child_colors: [{
        quantity: 1,
        color: 'dark maroon'
      }, {
        quantity: 3,
        color: 'dim maroon'
      }, {
        quantity: 5,
        color: 'striped green'
      }, {
        quantity: 2,
        color: 'pale aqua'
      }]
    })
  end
end
