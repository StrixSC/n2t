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
    branching_commands = ['goto']
    label_commands = ['label']
    if_commands = ['if-goto']
    function_commands = ['function']
    return_commands = ['return']
    call_commands = ['call']
    
    def __init__(self):
        self.command_count = 0
        self.previous_return_address = ""

    def create_bootstrap_command(self):
        return BootstrapCommand()
    
    def create_call_system_init_command(self):
        return SysInitCommand()
    
    def create_command(self, parsed_command: list = [], file_name: str = ""):
        self.command_count += 1
        command = parsed_command[0]
        arg_count = len(parsed_command)

        if command in CommandsFactory.return_commands:
            return ReturnCommand(self.previous_return_address, self.command_count)

        if command in CommandsFactory.arithmetic_commands:
            return ArithmeticCommand(self.command_count, command)

        if arg_count == 2:
            label_name = parsed_command[1]
            if command in CommandsFactory.label_commands:
                return LabelCommand([label_name])

            if command in CommandsFactory.branching_commands:
                return GotoCommand([label_name])
            
            if command in CommandsFactory.if_commands:
                return IfCommand([label_name])

        if arg_count == 3 and command in ['call', 'function']:
            function_name = parsed_command[1]
            nArgs = parsed_command[2]
            args = [function_name, nArgs]
            if command == 'call':
                return CallCommand(args, self.command_count)

            if command == 'function':
                self.previous_return_address = function_name
                return FunctionCommand(args)

        if arg_count == 3:
            memory_segment = CommandsFactory.memory_segments.get(
                parsed_command[1].lower()) if True else ""
            index = parsed_command[2]
            args = [memory_segment, index]
            is_push_command = command in CommandsFactory.push_commands

            if memory_segment == "pointer":
                return PointerPush(args) if is_push_command else PointerPop(args)

            if memory_segment == "static":
                return StaticPush(file_name, args) if is_push_command else StaticPop(file_name, args)

            if memory_segment == "constant":
                return ConstantPush(args)

            if memory_segment == "temp":
                return TempPush(args) if is_push_command else TempPop(args)

            return GenericPush(args) if is_push_command else GenericPop(args)