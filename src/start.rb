require_relative 'util/helpers'

file_to_run = ENV['FILE']

if file_to_run
  require_relative file_to_run

  run
end
