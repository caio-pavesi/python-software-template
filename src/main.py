'''
Example code for the main.py file. This is the entry point of the application. You can import and use functions from other modules here.
'''

from settings import VAR_1, VAR_2


class Main:
    def __init__(self):
        print("Main class initialized.")

    @property
    def var_one(self):
        return VAR_1

    @property
    def var_two(self):
        return VAR_2

if __name__ == "__main__":
    main = Main()
    print(f"VAR_1: {main.var_one}")
    print(f"VAR_2: {main.var_two}")
