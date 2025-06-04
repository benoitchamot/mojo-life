from grid import Grid


fn grid_str(current_grid: Grid) -> String:
    """
    Generate a string representation of the game grid.
    """

    str = String()

    rows = current_grid.rows
    cols = current_grid.cols
    grid = current_grid.data

    for row in range(rows):
        for col in range(cols):
            if grid[row][col] == 1:
                str += "*"
            else:
                str += " "

        if row != rows-1:
            str += "\n"
    
    return str


def main():
    # Initial state of the glider pattern
    glider = [
        [0, 1, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
    ]

    start = Grid(8, 8, glider)
    result = grid_str(start)
    print(result)
