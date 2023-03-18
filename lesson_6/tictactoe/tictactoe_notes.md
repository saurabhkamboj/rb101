# Tic Tac Toe

Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and marks a square on the board. First player to reach 3 squares in a row, including diagonals, wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie.

## Outline of game play

Attemp by self

1. Display an empty 3x3 board
2. Ask the user to input there move
3. Computers makes its move
4. Display the updated board
5. Display winner if any player has 3 squares in a row
6. If all squares are marked and no player has 3 squares in a row, display tie
7. Else, go to #2
8. Ask the user if they want to play again?
9. If yes, go to #1
10. Else, exit

By launch school

1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!

## Sub-methods

### Initializing the board values

`square_values = { 1 => ' ',
  2 => ' ',
  3 => ' ',
  4 => ' ',
  5 => ' ',
  6 => ' ',
  7 => ' ',
  8 => ' ',
  9 => ' ' }`

### To improve join

Goal:

The current prompt for *available positions* needs to include an 'or' instead of a ', ' before the number that is the last element in the array.

Examples:

joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Current output `=> Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, 9'

Required output `=> Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, or 9'

Data structures:

- The method should take 3 arguments, the array, a delimiter and another delimiter for the last element in the array.
- Parameters for the delimiters should have deafult values in case no argument is given. The default values should be ', ' and 'or '.

Algorithm:

- We can use each_with_index that can call a block with 2 arguments, the item and index, we can use the index to recoganise the last element in the array.

> Chose to use the solution provided by launch school given that it does not initiate a new variable.

### Computer AI: Defense

Problem:

Find if 2 squares are marked by the oponent on any line. If such a line exists pick the empty square in that line for computer's marker, if no such line exists pick a random valid square.

Example:
computer_defender({1=> "X", 2=> " ", 3=> "X", 4=> "O", 5=> " ", 6=> " ", 7=> " ", 8=> " ", 9=> " "})

`#=> {1=> "X", 2=> "2", 3=> "X", 4=> "O", 5=> " ", 6=> " ", 7=> " ", 8=> " ", 9=> " "}`

> Falised at writing the algorithm down, directly started to write code.
