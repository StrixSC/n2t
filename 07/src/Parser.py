class Parser:
    def __init__(self, input_file_name: str):
        try:
            self.input_file = open(input_file_name, "r+")
        except FileNotFoundError:
            self.input_file = False
            print("[!] Could not find the file. Please provide the full relative path.")

    def has_more_commands(self):
        if self.input_file:
            line = self.input_file.readline()
            if line.strip().startswith('//') or line == "\n":
                return "SKIP"
            return line.split('//')[0].strip()
        else:
            return False

    @staticmethod
    def split_command(command: str):
        return command.split(" ")
