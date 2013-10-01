class GamePlayer

	attr_accessor :human_move, :board_grid, :size, :board

	def initialize(params)
		@human_move = params[:human_move].to_i
		@size = params[:board_grid].length
		@board_grid = params[:board_grid]
		@winner_message = 'none'
	end

	def new_computer_and_board
		@computer = Computer.new
		@board = Board.new(@size)
	end

	def set_board_grid
		@board.grid = @board_grid.split("").map{|elem| elem.match("-") ? nil : elem}
	end

	def convert_board_to_string
		@board_grid = @board.grid.map{|elem| elem.nil? ? "-" : elem }.join
	end
end
