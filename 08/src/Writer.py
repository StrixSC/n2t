class Writer:
    def __init__(self, out_file_name):
        try:
            self.out_file = open(out_file_name, "w+")
        except FileExistsError:
            print("[!] File already exists")

    def write_asm_command(self, command: str):
        self.out_file.write(command)
