require 'spec_helper'

feature 'Play tic-tac-toe' do
	scenario 'player selects a spot, board shows X' do
		board_size_is("9")
		fill_in 'human_move', with: '0'
		click_button 'Hit Me!'
		expect(page).to have_css('.three', text: 'X')
	end

	scenario 'player selects a spot, computer returns O' do
		board_size_is("9")
		fill_in 'human_move', with: '0'
		click_button 'Hit Me!'
		expect(page).to have_css('.three', text: 'O')
	end

	scenario 'player selects a spot, other spots remain unoccupied' do
		board_size_is("16")
		fill_in 'human_move', with: '0'
		click_button 'Hit Me!'
		expect(page).to have_css('.four', text: '-', count: 14)
	end

	scenario 'player makes a second move' do
		board_size_is("9")
		fill_in 'human_move', with: '0'
		click_button 'Hit Me!'
		fill_in 'human_move', with: '1'
		click_button 'Hit Me!'
		# fill_in 'human_move', with: '3'
		# click_button 'Hit Me!'
		expect(page).to have_css('.three', text: 'O')
	end

	scenario 'player loses' do
		board_size_is("9")
		fill_in 'human_move', with: '0'
		click_button 'Hit Me!'
		fill_in 'human_move', with: '1'
		click_button 'Hit Me!'
		fill_in 'human_move', with: '3'
		# click_button 'Hit Me!'
		expect(page).to have_text('COMPUTER WINS')
	end
end
