require_relative './players.rb'

class Players::Computer

# meg's work:
# my Pseudocode:
# https://github.com/meg-gutshall/ttt-with-ai-project-v-000/blob/master/lib/players/AI_strategy.md

# First move choose middle if available because that cell is in 4 of 8 win combos.
# numbers in player perspective of board
#	four_wins = [5]
#	three_wins = [1, 3, 7, 9]
#	two_wins = [2, 4, 6, 8]

	def move(board = [])
    p "in Computer move method"

  end

#  # Meg move options
#    @@corner_move = [1, 3, 7, 9].sample.to_s
#    @@edge_move = [2, 4, 6, 8].sample.to_s
#    @@random_move = (1..9).to_a.sample.to_s
#
end
