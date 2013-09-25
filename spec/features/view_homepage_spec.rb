require 'spec_helper'

feature 'View the homepage' do
	scenario 'user sees relevant information' do
		visit root_path
		expect(page).to have_text "Size"
		expect(page).to have_css  '.intro'
	end
end
