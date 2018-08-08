#  Path of Least Cost
## The Challenge

The objective is to find the path of lowest cost when moving across a grid. For this challenge, you are provided a grid of integers where each integer represents the amount of cost encountered at a given point on the grid. A path enters the grid from the left (at any point) and passes through the grid to the right, moving only one column per round. Movement is always to the same row or an adjacent row, meaning the path can proceed horizontally or diagonally. For the sake of this challenge, we assume the first and last row are also adjacent. Effectively, the grid “wraps”.

The total cost of a path is the sum of the integers in each of the visited cells. The solution needs to handle grids of various sizes with a minimum of 1 row and 5 columns up to 10 rows and 100 columns. If in the next move, the total cost will exceed 50, that path is abandoned.

The purpose of this challenge is to find the path of least cost (that is, the path with the lowest total cost of any possible path). The paths of least cost through two slightly different 5 x 6 grids are shown below. The grid values differ only in the bottom row. The path for the grid on the right takes advantage of the adjacency between the first and last rows.

#  Input
The input consists of a sequence of row specifications. Each row is represented by a series of delimited integers on a single line.

#  Output
The output consists of three values:

Is a Valid input (the cost sum should be less then 50)
Total least cost
The path taken as a sequence of n delimited integers, each representing the rows traversed in turn.

## Sample 1: (6X5 matrix normal flow)

**Input:**

3 4 1 2 8 6

6 1 8 2 7 4

5 9 3 9 9 5

8 4 1 3 2 6

3 7 2 8 6 4

**Output:**

Valid : Yes

Cost : 16

Path : [1 2 3 4 4 5]

## Sample 2: (5X3 matrix with no path <50)

**Input:**

19 10 19 10 19

21 23 20 19 12

20 12 20 11 10

**Output:**

Valid :No

Cost : 48

Path : [1 1 1]

## Sample 3: (1X5 matrix)

**Input:**

5 8 5 3 5

**Output:**

Valid :Yes

Cost : 26

Path : [1 1 1 1 1]

