DAY_NUM = 5

def get_seat_id(seat_code)
  row = get_row(seat_code)
  column = get_column(seat_code)

  row * 8 + column
end

def get_row(seat_code)
  row = seat_code[0..6]
  row.gsub!('F', '0')
  row.gsub!('B', '1')
  row.to_i(2)
end

def get_column(seat_code)
  column = seat_code[7..9]
  column.gsub!('L', '0')
  column.gsub!('R', '1')
  column.to_i(2)
end

def get_max_seat_id(seat_codes)
  seat_ids = seat_codes.map do |seat_code|
    get_seat_id(seat_code)
  end

  seat_ids.max
end

def run
  seat_codes = get_input(DAY_NUM)
  max_seat_id = get_max_seat_id(seat_codes)
  puts "Max seat ID: #{max_seat_id}"
end
