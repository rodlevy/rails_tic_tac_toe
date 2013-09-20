require 'ultimate_tic_tac_toe'
require 'trash'

class InterfaceController < ApplicationController

	def index
		# puts "<<<<<<<<<  ", @board, "  >>>>>>>>>>>>>"
		# @moves = session[:size]
	end

	def create
		session[:move] = params[:move].to_i
		p "  >>>>>>>>>>>>>", session[:move], "  >>>>>>>>>>>>>"
		redirect_to '/interface'
	end

	def opening_prompt
		# puts "What size board do you want to play (9, 16, 25)"
		# session[:size]
	end

	def grid_size
		# puts "  >>>>>>>>>>>>"
		# # size = session[:size]
		# size = @board.grid.length
		# puts size
		# puts "<<<<<<<<<<"
		# size
		9

	end

	def axis_length(size)
		Math.sqrt(size).to_i
	end

	# def insert_spaces(position, size, output, grid)
	#    if position % axis_length(size) == (axis_length(size) - 1)
 #      	output << "\n" unless position == (size - 1)
 #      	else
 #      		if position < 10 || !grid[position].nil?
 #      			output << "   "
 #      		else
 #      			output << "  "
 #      	end
 #      end

	# end

	def pretty_print_board(grid)
		puts ">>>>>>>>>>>>>", @board
		redirect_to '/interface'
	end

	def prompt
		# puts "Where do you want to place your X?"
	end

	def user_input
		session[:move]
	end

	def denied
		puts "Already occupied, try again"
	end

	def cats_game
		puts "CATS GAME!"
	end

	def computer_wins
		puts "Computer wins!  Again"
	end

	def player_wins
		puts "Human wins!  Impossible!"
	end

	def reject(position)
		puts "#{position} isnt no good"
	end
end


