import random

@value
struct Grid(StringableRaising):
    var rows: Int
    var cols: Int
    var data: List[List[Int]]

    fn __str__(self) raises -> String:
        """
        Generate a string representation of the game grid.
        """

        str = String()

        for row in range(self.rows):
            for col in range(self.cols):
                if self[row, col] == 1:
                    str += "*"
                else:
                    str += " "

            if row != self.rows-1:
                str += "\n"

        return str

    fn __getitem__(self, row: Int, col: Int) -> Int:
        return self.data[row][col]

    fn __setitem__(mut self, row: Int, col: Int, value: Int) -> None:
        self.data[row][col] = value

    @staticmethod
    def glider() -> Self:
        """
        Initialise the grid with the glider pattern
        """
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

        return Self(8, 8, glider)

    @staticmethod
    fn random(rows: Int, cols: Int) -> Self:
        """
        Initialise the grid with a random pattern
        """
        random.seed()

        data = List[List[Int]]()

        for _ in range(rows):
            row_data = List[Int]()  # Same as row_data = []
            for _ in range(cols):
                # Generate a random 0 or 1
                row_data.append(Int(random.random_si64(0, 1)))
            data.append(row_data)

        return Self(rows, cols, data)

    fn evolve(self) -> Self:
        """
        Evolve the grid based on the game of life rules
        """
        next_gen = List[List[Int]]()

        for row in range(self.rows):
            row_data = List[Int]()

            # Wrap around = pacman style
            row_above = (row - 1) % self.rows
            row_below = (row + 1) % self.rows

            for col in range(self.cols):
                # Wrap around = pacman style
                col_left = (col - 1) % self.cols
                col_right = (col + 1) % self.cols

                # Determined the number of populated neighbours
                num_neighbours = (
                        self[row_above, col_left]
                        + self[row_above, col]
                        + self[row_above, col_right]
                        + self[row, col_left]
                        + self[row, col_right]
                        + self[row_below, col_left]
                        + self[row_below, col]
                        + self[row_below, col_right]
                )

                # Determinate the state of the cell for the next generation
                new_state = 0
                if self[row, col] == 1 and (num_neighbours in [2, 3]):
                    new_state = 1
                elif self[row, col] == 0 and num_neighbours == 3:
                    new_state = 1
                row_data.append(new_state)

            next_gen.append(row_data)

        return Self(self.rows, self.cols, next_gen)
