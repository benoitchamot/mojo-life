fn grid_str(rows: Int, cols: Int, grid: List[List[Int]]) -> String:
    """
    Generate a string representation of the game grid.
    """

    str = String()

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
    num_rows: Int = 8
    num_cols: Int = 8

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

    result = grid_str(num_rows, num_cols, glider)
    print(result)
