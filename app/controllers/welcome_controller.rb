require 'ultimate_tic_tac_toe'

class WelcomeController < ApplicationController

	def index
		fun_game = Game.new(Interface.new, Computer.new)
	end

	def create
		session[:size] = params[:board_size].to_i
		puts "session[:size] = ", session[:size]
		redirect to '/boards'
	end

end
