from python import Python

from grid import Grid

def run_display(owned grid: Grid) -> None:

    # Equivalent to import sys
    sys = Python.import_module("sys")

    while True:
        print(String(grid))
        print()
        if input("Enter 'q' to quit or <Enter> to continue: ") == "q":
            break
        grid = grid.evolve()

        # Move cursor up 10 lines
        sys.stdout.write('\033[10A')  # Move up 10 lines
        sys.stdout.flush()

def select_start() -> Grid:
    while True:
        print("Select a starting grid:")
        print("1. Random")
        print("2. Glider")

        select = input("Selection: ")

        if select == '1':
            return Grid.random(8, 8)
        elif select == '2':
            return Grid.glider()
        else:
            print("----")
            print("Unknown value - Try again")


def main():
    start = select_start()
    run_display(start)
