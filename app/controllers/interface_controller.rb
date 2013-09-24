require 'ultimate_tic_tac_toe'
require 'trash'
HUMAN = "X"

class InterfaceController < ApplicationController

	def index
		@message = ''
	end

	def create
		size = params[:board_size].to_i
		if size != 0
			check_grid_size(size)
		else
			get_params
			@winner_message = 'none'
			@computer = Computer.new
			@board = Board.new(@size)

			@board_grid[@human_move] = HUMAN
			set_board_grid
			if @board.winner?("X") == true
				@winner_message = "HUMAN WINS, IMPOSSIBLE"
			else
				@computer.computer_move(@board)
				check_computer_victory
			convert_board_to_string
			end
			render 'new'
		end
	end

	def convert_board_to_string
		temp_board = @board.grid
		@board_grid = temp_board.map{|elem| elem.nil? ? "-" : elem }.join
	end

	def set_board_grid
		@board.grid = @board_grid.split("").map{|elem| elem.match("-") ? nil : elem}
	end

	def check_computer_victory
		if @board.winner?("O") == true
			@winner_message = "COMPUTER WINS, of course"
			# render 'board/index' and_return
		elsif @board.tie?
			@winner_message = "TIE Game"
		end
	end

	def get_params
		@human_move = params[:human_move].to_i
		@size = params[:board_grid].length
		@board_grid = params[:board_grid]
	end

	def check_grid_size(size)
		if size == 9 || size == 16 || size == 25
			@size = size
			@board = Board.new(@size)
			convert_board_to_string
			@computer_moves = ''
			@winner_message = 'none'
			render 'new'
		else
			@message = "Please Enter 9, 16 or 25"
			@size = size
			render 'index'
		end
	end

end


