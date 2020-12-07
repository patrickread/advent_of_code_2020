require_relative '../../src/6/main_a'

describe 'get_unique_yeses' do
  it 'returns correctly for known values' do
    expect(get_unique_yeses(['abc'])).to eq(3)
    expect(get_unique_yeses(['a', 'b', 'c'])).to eq(3)
    expect(get_unique_yeses(['ab', 'ac'])).to eq(3)
    expect(get_unique_yeses(['a', 'a', 'a', 'a'])).to eq(1)
    expect(get_unique_yeses(['b'])).to eq(1)
  end
end
