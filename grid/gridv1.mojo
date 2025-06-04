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
    def random(rows: Int, cols: Int) -> Self:
        random.seed()

        data = List[List[Int]]()

        for _ in range(rows):
            row_data = List[Int]()  # Same as row_data = []
            for _ in range(cols):
                # Generate a random 0 or 1
                row_data.append(Int(random.random_si64(0, 1)))
            data.append(row_data)

        return Self(rows, cols, data)


