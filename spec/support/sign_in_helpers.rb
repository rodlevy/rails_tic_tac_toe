module SignInHelpers
	def board_size_is(board_size)
		visit root_path
		fill_in 'board_size', with: board_size
		click_button 'Enter'
	end
end

