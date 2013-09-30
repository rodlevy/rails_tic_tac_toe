require 'spec_helper'
require './lib/TTT/game_player'

describe GamePlayer do
	let!(:params) {Hash.new({:human_move => 1, :board_grid => '-x-------'})}
	let(:gameplayer) {GamePlayer.new(:params)}

	describe '.initialize' do
		it 'creates a new gameplayer with params' do
			expect(gameplayer.human_move).to eq 1
		end
	end


end
