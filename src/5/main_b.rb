DAY_NUM = 5

def get_seat_obj(seat_code)
  row = get_row(seat_code)
  column = get_column(seat_code)

  {
    row: row,
    column: column
  }
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

def sorted_seats(seat_codes)
  seat_ids = seat_codes.map do |seat_code|
    get_seat_obj(seat_code)
  end

  seat_ids.sort_by{ |x| x[:row] * 8 + x[:column] }
end

def get_my_seat_id(seat_codes)
  sorted = sorted_seats(seat_codes)

  sorted.each_with_index do |seat, index|
    if seat[:column] == 7
      next_seat = { row: seat[:row] + 1, column: 0 }
    else
      next_seat = { row: seat[:row], column: seat[:column] + 1 }
    end

    return (next_seat[:row] * 8 + next_seat[:column]) if next_seat != sorted[index + 1]
  end

  nil
end

def run
  seat_codes = get_input(DAY_NUM)
  max_seat_id = get_my_seat_id(seat_codes)
  puts "My seat ID: #{max_seat_id}"
end
