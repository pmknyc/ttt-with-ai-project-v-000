require_relative './players.rb'

class Players::Computer

# numbers in player perspective of board
#	@@best_move = [5] # 4 of 8 win combos
#	@@better_move = [1, 3, 7, 9] # 3 of 8 win combos
#	@@good_move = [2, 4, 6, 8] # 2 of 8 win combos

# game.turn method will call current_player.move
# First move choose middle if available because that cell is in 4 of 8 win combos.

#  def turn
#    move_input = current_player.move
#      if  !board.valid_move?(move_input) # if #valid_move false
#        puts "That is not a valid move. Please try again.\n"
#        turn
	def move(board = [])
    p "in Computer move method"
		best_move = [5] # 4 of 8 win combos
		better_move = [1, 3, 7, 9] # 3 of 8 win combos
		good_move = [2, 4, 6, 8] # 2 of 8 win combos
		move_options = [best_move, better_move,  good_move]
		p move_options
	end



  end


# meg's work:
# my Pseudocode:
# https://github.com/meg-gutshall/ttt-with-ai-project-v-000/blob/master/lib/players/AI_strategy.md

#  # Meg move options
#    @@corner_move = [1, 3, 7, 9].sample.to_s
#    @@edge_move = [2, 4, 6, 8].sample.to_s
#    @@random_move = (1..9).to_a.sample.to_s
#
end
