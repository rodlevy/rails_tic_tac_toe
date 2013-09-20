require 'ultimate_tic_tac_toe'
require 'trash'

class InterfaceController < ApplicationController

	def index
		@message = ''
	end

	def create
		size = params[:board_size].to_i
		if size != 0
			check_grid_size(size)
		else
			@player_moves = params[:player_moves]
			@player_moves << params[:player_move]
			@size = params[:size]
			# @fun_game.play
			game = Game.new(self, Computer.new)
			game.play
			render 'new'
		end
	end

	def pretty_print_board(grid)
		print grid
		@grid = grid
		# render 'new'
	end

	def prompt
	end

	def check_grid_size(size)
		if size == 9 || size == 16 || size == 25
			@size = size
			# create_game
			render 'new'
		else
			@message = "Please Enter 9, 16 or 25"
			@size = size
			render 'index'
		end
	end

	# def create_game
	# 	@fun_game = Game.new(self, Computer.new)
	# end

	def opening_prompt
	end

	def grid_size
		params[:size].to_i
	end

	def axis_length(size)
		Math.sqrt(size).to_i
	end


	def user_input
		params[:player_move]
	end

	def denied
		# puts "Already ruined try again"
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


