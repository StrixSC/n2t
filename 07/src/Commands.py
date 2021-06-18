from Assembly import *

class Command:
    def __init__(self, command_type: str = "", args: list = []):
        self.args = args
        self.command_type = command_type


class PointerPush(Command):
    def __init__(self, command_type: str = "", args: list = []):
        super(PointerPush, self).__init__(command_type, args)

    def to_hack_asm(self):
        memory_segment = "THIS" if self.args[1] == "0" else "THAT"
        return pointer_push.format(memory_segment)

class PointerPop(Command):
    def __init__(self, command_type: str = "", args: list = []):
        super(PointerPop, self).__init__(command_type, args)

    def to_hack_asm(self):
        memory_segment = "THIS" if self.args[1] == "0" else "THAT" 
        return pointer_pop.format(memory_segment)

# Command for pushing into local, arg, this, that
class GenericPush(Command):
    def __init__(self, command_type: str = "", args: list = []):
        super(GenericPush, self).__init__(command_type, args)
        self.command_type = "C_PUSH"

    def to_hack_asm(self):
        return push.format(self.args[0], self.args[1])


class GenericPop(Command):
    def __init__(self, command_type: str = "", args: list = []):
        super(GenericPop, self).__init__(command_type, args)
        self.command_type = "C_POP"

    def to_hack_asm(self):
        return pop.format(self.args[0], self.args[1])


class ConstantPush(GenericPush):
    def __init__(self, command_type: str = "", args: list = []):
        super(ConstantPush, self).__init__(command_type, args)

    def to_hack_asm(self):
        return constant_push.format(self.args[1])


class TempPush(GenericPush):
    def __init__(self, command_type: str = "", args: list = []):
        super(TempPush, self).__init__(command_type, args)

    def to_hack_asm(self):
        address = 5 + int(self.args[1])
        return temp_push.format(address)


class TempPop(GenericPop):
    def __init__(self, command_type: str = "", args: list = []):
        super(TempPop, self).__init__(command_type, args)

    def to_hack_asm(self):
        address = 5 + int(self.args[1])
        return temp_pop.format(address)


class StaticPush(GenericPush):
    def __init__(self, file_name: str, command_type: str = "", args: list = []):
        super(StaticPush, self).__init__(command_type, args)
        self.file_name = file_name

    def to_hack_asm(self):
        address = "{0}.{1}".format(self.file_name.replace("/", ""), self.args[1])
        return static_push.format(address)


class StaticPop(GenericPop):
    def __init__(self, file_name: str, command_type: str = "", args: list = []):
        super(StaticPop, self).__init__(command_type, args)
        self.file_name = file_name

    def to_hack_asm(self):
        address = "{0}.{1}".format(self.file_name.replace("/", ""), self.args[1])
        return static_pop.format(address)


class ArithmeticCommand(Command):
    operators = {
        "add": add_command,
        "sub": sub_command,
        "neg": neg_command,
        "eq": eq_command,
        "gt": gt_command,
        "lt": lt_command,
        "and": and_command,
        "or": or_command,
        "not": not_command
    }

    def __init__(self, command_count: int = 0, command_type: str = "", command: str = ""):
        self.command_count = command_count
        self.command = command
        super(ArithmeticCommand, self).__init__(command_type, [command])

    def to_hack_asm(self):
        asm_command = ArithmeticCommand.operators.get(self.command)
        print(asm_command)
        if asm_command:
            return asm_command.format(self.command_count)
        else:
            return ""
