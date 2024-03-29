from CommandsFactory import CommandsFactory
from Parser import Parser
from Writer import Writer

def main():
    import argparse

    arg_parser = argparse.ArgumentParser(description="Translate .jack programs to Hack Assembly.")
    arg_parser.add_argument('input_file', metavar='I', type=str, nargs='+', help='Path of the .vm file')
    args = arg_parser.parse_args()
    if not args.input_file:
        print("Please provide valid input file")

    input_file = args.input_file[0]
    output_file = input_file[0:str(input_file).find(".")]
    parser = Parser(input_file)
    command_factory = CommandsFactory()
    writer = Writer(output_file + ".asm")

    next_command = parser.has_more_commands()
    while next_command:
        if next_command != "SKIP":
            parsed_command = parser.split_command(next_command)
            print("Command: " + next_command)
            command = command_factory.create_command(parsed_command, output_file)

            if command:
                writer.write_asm_command("// %s" % next_command)
                writer.write_asm_command(command.to_hack_asm())
                writer.write_asm_command("\n")
        next_command = parser.has_more_commands()
        print(next_command)

    print("Process completed successfully")
    exit(0)


if __name__ == '__main__':
    main()
