class GamePlayer

	attr_accessor :human_move, :board_grid, :size, :board, :initial_board_size

	def initialize(params)
		@human_move ||= params[:human_move].to_i
		@size = (params[:board_grid].nil? ? 0 : params[:board_grid].length)
		@game_values = Hash.new
		@board_grid ||= params[:board_grid]
		@game_values[:board_grid] = @board_grid
		@game_values[:winner_message] = 'none'
		@game_values[:initial_board_size] = params[:board_size]
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

	def board_spot_empty?
		@board_grid[@human_move] == "-"
	end

	def check_computer_victory
		if @board.winner?(GlobalVars::COMPUTER) == true
			@game_values[:winner_message] = "COMPUTER WINS, of course"
		elsif @board.tie?
			@game_values[:winner_message] = "TIE Game"
		end
	end

	def start_game
		@board = Board.new(@size)
		convert_board_to_string
		@computer_moves = ''
	end

	def check_grid_size(size)
		if size == GlobalVars::ThreeXThree || size == GlobalVars::FourXFour || size == GlobalVars::FiveXFive
			start_game
			@ok_game_message = 'initializing'
		else
			@ok_game_message = "Please Enter 9, 16 or 25"
		end
		@ok_game_message
	end

	def play
		unless board_spot_empty?
			@game_values[:warning] = "Please enter an unoccupied spot"
		else
			new_computer_and_board
			@board_grid[@human_move] = "X"
			@game_values[:warning] = ''
			set_board_grid
			if @board.winner?("X") == true
				@game_values[:winner_message] = "HUMAN WINS, IMPOSSIBLE"
			else
				@computer.computer_move(@board)
				check_computer_victory
				convert_board_to_string
				@game_values[:board_grid] = @board_grid
			end
		end
		@game_values
	end

	def check_start_of_game(size)
		if @game_values[:initial_board_size].nil?
			@ok_game_message = 'playing'
		else
			check_grid_size(size)
		end
	end
end
