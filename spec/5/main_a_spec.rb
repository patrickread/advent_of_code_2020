require_relative '../../src/5/main_a'

describe 'get_seat_id' do
  it 'returns correctly for known values' do
    expect(get_seat_id('BFFFBBFRRR')).to eq(567)
    expect(get_seat_id('FFFBBBFRRR')).to eq(119)
    expect(get_seat_id('BBFFBBFRLL')).to eq(820)
  end
end
