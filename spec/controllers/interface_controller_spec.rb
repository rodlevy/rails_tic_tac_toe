require 'spec_helper'

describe InterfaceController do
	let (:new_board_9){Board.new(9)}
	let (:new_board_16){Board.new(16)}
	let (:new_computer){Computer.new}

	# describe "GET #index" do
	#     it "responds successfully with an HTTP 200 status code" do
	#       get :index
	#       expect(response).to be_success
	#       expect(response.status).to eq(200)
	#     end
	#     it "renders the index template" do
	#       get :index
	#       expect(response).to render_template("index")
	#     end
	# end

	describe "a Board's size" do
  	subject { new_board_9.grid }
  		its(:size) { should eq(9) }
	end

	it 'should set the board into array so computer can check it ' do
		@board_grid = "X--------"
		expect{set_board_grid}.to receive(["X", nil, nil, nil, nil, nil, nil, nil])
	end

	it 'should initially have no warning of incorrect board input' do

	end


end


