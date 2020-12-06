def get_input(day_num)
  file_path = "/inputs/#{day_num}/input.txt"
  file = File.open(file_path)
  file.readlines.map(&:chomp)
end
