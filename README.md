
Tic-Tac-Toe
---

Instructions for use:

- in the terminal `cd` to the appropriate directory
- `git clone` this repository
- `cd` into the directory
- run `bundle`
- run `rspec` to see tests
- run `irb` or `pry` from project directory to play Tic-Tac-Toe:

```ruby
$ pry
> require './lib/game_manager'
> tic_tac_toe = GameManager.new
```
RULES
---=
For every new game:
1. set game type
  - 1 = human v human
  - 2 = computer v computer
  - 3 = human v computer
2. set who moves first
  - either `:x` or `:o`
  - and whether you want the computer to move first
3. Play the game!
  - to make a human move, pass in two arguments: `tic_tac_toe.play(row, column)` where row and column are indexed at 0
    - top left is thus `tic_tac_toe.play(0,0)`
    - middle square is thus `tic_tac_toe.play(1,1)`
    - bottom right is thus `tic_tac_toe.play(2,2)`
  - to make a computer move, simply use `tic_tac_toe.play` and watch the computer flawlessly pick its move!

Human v Human
---
```ruby
> tic_tac_toe.set_game_type(1)
> tic_tac_toe.set_player_one(:o, Player)
> tic_tac_toe.play(0,0)
o |  |
---------
  |  |
---------
  |  |
> tic_tac_toe.play(1,0)
o |  |
---------
x |  |
---------
  |  |
> tic_tac_toe.play(2,0)
o |  |
---------
x |  |
---------
o |  |
> tic_tac_toe.play(0,1)
o | x |
---------
x |  |
---------
o |  |
> tic_tac_toe.play(1,1)
o | x |
---------
x | o |
---------
o |  |
> tic_tac_toe.play(0,2)
o | x | x
---------
x | o |
---------
o |  |
> tic_tac_toe.play(2,2)
o | x | x
---------
x | o |
---------
o |  | o
=> "o has won!"
```
Human v Computer
---
```ruby
> tic_tac_toe.set_game_type(3)
> tic_tac_toe.set_player_one(:x, ComputerPlayer)
> tic_tac_toe.play
  |  |
---------
  | x |
---------
  |  |
> tic_tac_toe.play(0,0)
o |  |
---------
  | x |
---------
  |  |
> tic_tac_toe.play
o |  | x
---------
  | x |
---------
  |  |
> tic_tac_toe.play(0,1)
o | o | x
---------
  | x |
---------
  |  |
> tic_tac_toe.play
o | o | x
---------
  | x |
---------
x |  |
=> "x has won!"
```
Computer v Computer
---
```ruby
> tic_tac_toe.set_game_type(2)
> tic_tac_toe.set_player_one(:o, ComputerPlayer)
> tic_tac_toe.play
  |  |
---------
  | x |
---------
  |  |
> tic_tac_toe.play
o |  |
---------
  | x |
---------
  |  |
> tic_tac_toe.play
o |  | x
---------
  | x |
---------
  |  |
> tic_tac_toe.play
o |  | x
---------
  | x |
---------
o |  |
> tic_tac_toe.play
o |  | x
---------
x | x |
---------
o |  |
> tic_tac_toe.play
o |  | x
---------
x | x | o
---------
o |  |
> tic_tac_toe.play
o |  | x
---------
x | x | o
---------
o |  | x
> tic_tac_toe.play
o | o | x
---------
x | x | o
---------
o |  | x
> tic_tac_toe.play
o | o | x
---------
x | x | o
---------
o | x | x
=> "game over"
```
