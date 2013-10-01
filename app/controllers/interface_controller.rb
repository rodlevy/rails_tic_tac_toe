require 'ultimate_tic_tac_toe'
HUMAN = "X"
require './lib/TTT/game_player'

class InterfaceController < ApplicationController

	def index
	end

	def create
		@gameplayer = GamePlayer.new(params)
		size = params[:board_size].to_i

		ok_game_message = @gameplayer.check_start_of_game(size)

		if ok_game_message == 'initializing'
			@gameplayer.board = Board.new(size)
			get_initial_parameters
			render 'new'
		elsif ok_game_message == "Please Enter 9, 16 or 25"
			@message = ok_game_message
			render 'index'
		elsif ok_game_message == 'playing'
			in_game_params
			render 'new'

		end
	end

	def get_initial_parameters
		@winner_message = 'none'
		@board_grid = @gameplayer.convert_board_to_string
		@computer_moves =''
	end

	def in_game_params
		@game_values = @gameplayer.play
		@board_grid = @game_values[:board_grid]
		@winner_message = (@game_values[:winner_message] == 'none' ? 'none' : @game_values[:winner_message])
		@warning = @game_values[:warning]
	end


end


