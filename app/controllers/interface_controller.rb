require 'ultimate_tic_tac_toe'
require 'trash'

class InterfaceController < ApplicationController

	def index
		@message = ''
	end

	def update
		puts params[:player_move]
		create_game
	end


	def create
		size = params[:board_size].to_i
		if size != 0
			check_grid_size(size)
		else
			@player_moves = params[:player_moves]
			@player_moves << params[:player_move]
			# print @player_moves[]
			@size = params[:size]
			@fun_game = params[:fun_game]
			# @fun_game.play
			render 'new'
		end
	end

	def prompt
		4
	end


	def check_grid_size(size)
		if size == 9 || size == 16 || size == 25
			@size = size
			create_game
			render 'new'
		else
			@message = "Please Enter 9, 16 or 25"
			@size = size
			render 'index'
		end
	end

	def create_game
		@fun_game = Game.new(InterfaceController.new, Computer.new)
	end

	# def play_game
	# 	@fun_game.play
	# end

	def opening_prompt
	end

	def grid_size
		# puts params[:size]
		# params[:size]
		9
	end

	def axis_length(size)
		Math.sqrt(size).to_i
	end

	def pretty_print_board(grid)
		# puts ">>>>>>>>>>>>>", @board
		# render :index
	end

	def prompt
		# puts "Where do you want to place your X?"
	end

	def user_input
		puts "We're at the user_input method"
		4
	end

	def denied
		puts "Already ruined try again"
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


