##  bin/tictactoe
The requirements of your CLI are as follows, free for you to implement however you see fit as we provide no tests against the CLI.

**************

Greet the user with a message.

Prompt the user for what kind of game they want to play, 0,1, or 2 player.

Ask the user for who should go first and be "X".

Use the input to correctly initialize a Game with the appropriate player types and token values.

When the game is over, the CLI should prompt the user if they would like to play again and allow them to choose a new configuration for the game as described above. If the user doesn't want to play again, exit the program.

*****************

You can implement this logic within the bin/tictactoe directly or encapsulate it within Game via a method like #start and simply evoke that method in the CLI. There is no wrong way to implement code that works.

If you'd like, implement a "wargames" game type. When asked what kind of game they want to play or for the number of players, if the user types in "wargames", have the computer play itself 100 times and report how many times the game was won. This is not a requirement, it would just be fun. A perfect computer AI should never be able to win, like in the case of thermonuclear war.