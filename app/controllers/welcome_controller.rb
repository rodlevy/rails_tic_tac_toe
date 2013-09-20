require 'ultimate_tic_tac_toe'
require 'trash'

class WelcomeController < ApplicationController

	def index
		@trash = Trash.new(8)
		puts @trash.size
		puts @trash.number_9
		@message = ''
	end

	def create
		size = session[:size] = params[:board_size].to_i
		@trash = Trash.new(8)
		puts "TRASH: ", @trash.size
		puts @trash.number_9
		grid_size(size)
	end

	def grid_size(size)
		if size == 9 || size == 16 || size == 25
			session[:size] = size.to_i
			create_game
			redirect_to '/board'
		else
			@message = "Please Enter 9, 16 or 25"
			render 'index'
		end
	end

	def create_game
		@fun_game = Game.new(InterfaceController.new, Computer.new)
		puts 'made it to create_game', session[:size]
		# @board = Board.new(session[:size])
		puts "made a board: ", @board
		play_game
	end

	def play_game
		@fun_game.play
	end
end
