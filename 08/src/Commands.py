from Assembly import *

class Command:
    def __init__(self, args: list = []):
        self.args = args

class PointerPush(Command):
    def __init__(self, args: list = []):
        super(PointerPush, self).__init__(args)

    def to_hack_asm(self):
        memory_segment = "THIS" if self.args[0] == "0" else "THAT"
        return pointer_push.format(memory_segment)

class PointerPop(Command):
    def __init__(self, args: list = []):
        super(PointerPop, self).__init__(args)

    def to_hack_asm(self):
        memory_segment = "THIS" if self.args[0] == "0" else "THAT" 
        return pointer_pop.format(memory_segment)

# Command for pushing into local, arg, this, that
class GenericPush(Command):
    def __init__(self, args: list = []):
        super(GenericPush, self).__init__(args)

    def to_hack_asm(self):
        return push.format(self.args[0], self.args[1])


class GenericPop(Command):
    def __init__(self, args: list = []):
        super(GenericPop, self).__init__(args)

    def to_hack_asm(self):
        return pop.format(self.args[0], self.args[1])


class ConstantPush(GenericPush):
    def __init__(self, args: list = []):
        super(ConstantPush, self).__init__(args)

    def to_hack_asm(self):
        return constant_push.format(self.args[1])


class TempPush(GenericPush):
    def __init__(self, args: list = []):
        super(TempPush, self).__init__(args)

    def to_hack_asm(self):
        address = 5 + int(self.args[1])
        return temp_push.format(address)


class TempPop(GenericPop):
    def __init__(self, args: list = []):
        super(TempPop, self).__init__(args)

    def to_hack_asm(self):
        address = 5 + int(self.args[1])
        return temp_pop.format(address)


class StaticPush(GenericPush):
    def __init__(self, file_name: str, args: list = []):
        super(StaticPush, self).__init__(args)
        self.file_name = file_name

    def to_hack_asm(self):
        address = "{0}.{1}".format(self.file_name.replace("/", ""), self.args[1])
        return static_push.format(address)


class StaticPop(GenericPop):
    def __init__(self, file_name: str, args: list = []):
        super(StaticPop, self).__init__(args)
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

    def __init__(self, command_count: int = 0, command: str = ""):
        super(ArithmeticCommand, self).__init__()
        self.command_count = command_count
        self.command = command

    def to_hack_asm(self):
        asm_command = ArithmeticCommand.operators.get(self.command)
        if asm_command:
            return asm_command.format(self.command_count)
        else:
            return ""


# return LabelCommand(file_name, label_name)
class LabelCommand(Command):
    def __init__(self, args):
        super(LabelCommand, self).__init__(args)
    
    def to_hack_asm(self):
        label_name = self.args[0]
        return label.format(label_name)


class IfCommand(Command):
    def __init__(self, args):
        super(IfCommand, self).__init__(args)
    
    def to_hack_asm(self):
        label_name = self.args[0]
        return ifgoto.format(label_name)


class GotoCommand(Command):
    def __init__(self, label_name: str):
        super(GotoCommand, self).__init__()
        self.label_name = label_name
    
    def to_hack_asm(self):
        return goto.format(self.label_name)


class FunctionCommand(Command):
    def __init__(self, args):
        super(FunctionCommand, self).__init__(args)
        
    def to_hack_asm(self):
        function_name = self.args[0]
        asm = function_setup_label.format(function_name)
        nVar = int(self.args[1])
        for i in range(1, nVar):
            asm += "\n" + function_push_lcl.format(i) + "\n"
        return asm

class CallCommand(Command):
    def __init__(self, args):
        super(CallCommand, self).__init__(args)
    
    def to_hack_asm(self):
        function_name = self.args[0]
        nArgs = int(self.args[1])
        return call.format(function_name, nArgs)

class ReturnCommand(Command):
    def __init__(self, previous_return_address):
        super(ReturnCommand, self).__init__()
        self.previous_return_address = previous_return_address
    
    def to_hack_asm(self):
        return ret.format(self.previous_return_address)