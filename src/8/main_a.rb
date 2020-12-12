DAY_NUM = 8

Instruction = Struct.new(:command, :number, keyword_init: true)

def parse_instruction(instruction)
  command, number = instruction.split(' ')
  Instruction.new(command: command, number: Integer(number))
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
  while !ran_instructions.include?(current_index)
    ran_instructions << current_index
    instruction = parse_instruction(instructions[current_index])
    results = run_instruction(instruction, current_index, number)
    current_index = results[:current_index]
    number = results[:number]
  end

  puts "Number now equals #{number}"
end

def run
  all_instructions = get_input(DAY_NUM)
  run_instructions(all_instructions)
end
