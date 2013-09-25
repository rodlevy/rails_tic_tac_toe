require 'spec_helper'

feature 'View the homepage' do
	scenario 'user sees relevant information' do
		visit root_path
		expect(page).to have_text "Size"
	end

	scenario 'user enters the size of the board' do
		board_size_is("9")
		expect(page).to have_text '[6, 7, 8]'
	end

end


