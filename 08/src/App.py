from CommandsFactory import CommandsFactory
from Parser import Parser
from Writer import Writer
import os
import glob
import argparse

def main():

    arg_parser = argparse.ArgumentParser(
        description="Translate .jack programs to Hack Assembly.")
    arg_parser.add_argument('input_arg', metavar='I',
                            type=str, nargs='+', help='Path of the .vm file or directory')
    args = arg_parser.parse_args()
    if not args.input_arg:
        print("Please provide valid input file")

    input_arg = args.input_arg[0]
    is_dir = os.path.isdir(input_arg)

    output_file = os.path.basename(os.path.normpath(input_arg)) + ".asm"
    file_list = []
    if is_dir:
        file_list = glob.glob(input_arg + "*.vm")
    else:
        file_list = [input_arg]

    writer = Writer(os.path.normpath(input_arg) + "/" + output_file)
    command_factory = CommandsFactory()
    bootstrap_command = command_factory.create_bootstrap_command()
    writer.write_asm_command(bootstrap_command.to_hack_asm())
    sys_file_list = [s for s in file_list if "Sys.vm" in s]

    if len(sys_file_list) > 0:
        sysinit_command = command_factory.create_call_system_init_command()
        writer.write_asm_command("// call Sys.init 0")
        writer.write_asm_command(sysinit_command.to_hack_asm())
    
    for f in file_list:
        parser = Parser(f)
        next_command = parser.has_more_commands()
        while next_command:
            if next_command != "SKIP":
                parsed_command = parser.split_command(next_command)
                command = command_factory.create_command(
                    parsed_command, str(os.path.basename(os.path.normpath(f))).split(".")[0])
                if command:
                    writer.write_asm_command("// %s" % next_command)
                    writer.write_asm_command(command.to_hack_asm())
                    writer.write_asm_command("\n")
            
            next_command = parser.has_more_commands()

    print("Process executed successfully")
    exit(0)


if __name__ == '__main__':
    main()
