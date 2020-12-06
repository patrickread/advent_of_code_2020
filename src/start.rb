file_to_run = ENV['FILE']
puts "File to run: #{file_to_run}"

require_relative file_to_run

start
