from Commands import *

class CommandsFactory:
    arithmetic_commands = ['add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not']
    push_commands = ['push']
    pop_commands = ['pop']
    memory_segments = {
        "local": "LCL",
        "argument": "ARG",
        "this": "THIS",
        "that": "THAT",
        "temp": "temp",
        "static": "static",
        "constant": "constant",
        "pointer": "pointer",
    }

    def __init__(self):
        self.command_count = 0

    def create_command(self, parsed_command: list, file_name: str):
        self.command_count += 1
        command = parsed_command[0]

        if command in CommandsFactory.arithmetic_commands:
            command_type = "C_ARITHMETIC"
            return ArithmeticCommand(self.command_count, command_type, command)

        args = [CommandsFactory.memory_segments[parsed_command[1].lower()] if True else "", parsed_command[2]]
        if command in CommandsFactory.push_commands:
            command_type = "C_PUSH"
            if args[0] == "pointer": 
                return PointerPush(command_type, args)
            elif args[0] == "static":
                return StaticPush(file_name, command_type, args)
            elif args[0] == "constant":
                return ConstantPush(command_type, args)
            elif args[0] == "temp":
                return TempPush(command_type, args)
            else:
                return GenericPush(command_type, args)

        elif command in CommandsFactory.pop_commands:
            command_type = "C_POP"
            if args[0] == "pointer": 
                return PointerPop(command_type, args)
            elif args[0] == "static":
                return StaticPop(file_name, command_type, args)
            elif args[0] == "temp":
                return TempPop(command_type, args)
            else:
                return GenericPop(command_type, args)
