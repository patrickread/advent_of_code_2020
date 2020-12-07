require_relative '../../src/6/main_b'

describe 'get_common_yeses' do
  it 'returns correctly for known values' do
    expect(get_common_yeses(['abc'])).to eq(3)
    expect(get_common_yeses(['a', 'b', 'c'])).to eq(0)
    expect(get_common_yeses(['ab', 'ac'])).to eq(1)
    expect(get_common_yeses(['a', 'a', 'a', 'a'])).to eq(1)
    expect(get_common_yeses(['b'])).to eq(1)
    expect(get_common_yeses(['abc', 'cde', 'def'])).to eq(0)
  end
end
