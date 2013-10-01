require 'spec_helper'
require './lib/TTT/game_player'
require 'ultimate_tic_tac_toe'


describe GamePlayer do
	let!(:params) {{:human_move => 1, :board_grid => '-X-------'}}
	let(:gameplayer) {GamePlayer.new(params)}
	let(:new_board) {Board.new(gameplayer.board_grid.length)}
	let(:new_computer) {Computer.new}

	describe '.initialize' do
		it 'creates a new gameplayer with params' do
			expect(gameplayer.human_move).to eq 1
		end
	end

	describe '.initialize' do
		it 'creates a new gameplayer with params' do
			expect(gameplayer.board_grid.length).to eq 9
		end
	end

	# describe '#new_computer_and_board' do
	# 	it 'instantiates and new computer and board' do
	# 		expect(gameplayer).to receive(:new_computer_and_board).and_return(Board.new(9))
	# 	end
	# end

	describe '#set_board_grid' do
		it 'converts the board from the view into an array' do
			gameplayer.new_computer_and_board
			expect(gameplayer.set_board_grid).to eq([nil, "X", nil, nil, nil, nil, nil, nil, nil])
		end
	end

	describe '#convert_board_to_string' do
		it 'converts board from array into string' do
			gameplayer.new_computer_and_board
			gameplayer.board.grid = [nil, "X", nil, nil, nil, nil, nil, nil, nil]
			expect(gameplayer.convert_board_to_string).to eq('-X-------')
		end
	end


end
