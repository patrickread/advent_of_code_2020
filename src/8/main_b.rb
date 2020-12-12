DAY_NUM = 8

Instruction = Struct.new(:command, :number, :index, keyword_init: true)

def parse_instruction(instruction, index)
  command, number = instruction.split(' ')
  Instruction.new(command: command, number: Integer(number), index: index)
end

def run_instruction(instruction_model, current_index, number)
  case instruction_model.command
  when 'acc'
    number += instruction_model.number
    current_index += 1
  when 'jmp'
    current_index += instruction_model.number
  else
    current_index += 1
  end

  {
    current_index: current_index,
    number: number
  }
end

def run_instructions(instructions)
  current_index = 0
  number = 0
  ran_instructions = []
  last_line = instructions.length - 1
  while !ran_instructions.include?(current_index)
    can_exit = false
    can_exit = true if current_index == last_line

    ran_instructions << current_index
    instruction = instructions[current_index]
    results = run_instruction(instruction, current_index, number)
    current_index = results[:current_index]
    number = results[:number]

    if can_exit
      puts "Can exit with number #{number}"
      return number
    end
  end

  puts "Failed to break loop. Number now equals #{number}"
  "nope"
end

def parse_instructions(instructions)
  parsed = []
  instructions.each_with_index do |instruction, index|
    parsed << parse_instruction(instruction, index)
  end

  parsed
end

def update_instructions(instructions, tried)
  cloned_instructions = instructions.map(&:clone)
  cloned_instructions.each do |instruction|
    next if instruction.command != 'jmp' && instruction.command != 'nop'

    if !tried.include?(instruction.index)
      old = instruction.command
      if instruction.command == 'jmp'
        instruction.command = 'nop'
      elsif instruction.command == 'nop'
        instruction.command = 'jmp'
      end

      puts "Switching command ##{instruction.index} from #{old} to #{instruction.command}"
      tried << instruction.index

      break
    end
  end

  cloned_instructions
end

def run
  all_instructions = get_input(DAY_NUM)
  all_instructions = parse_instructions(all_instructions)
  tried = []
  result = 'nope'
  while result == 'nope'
    instructions = update_instructions(all_instructions, tried)
    result = run_instructions(instructions)
  end
end
