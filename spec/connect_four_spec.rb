require_relative "spec_helper"

describe ConnectFour do 

  before :each do
  	@cf = ConnectFour.new
  	@board = @cf.board
  	@round = @cf.round
  	@player1 = @cf.player1
  	@player2 = @cf.player2
  	@current_player = @cf.current_player
  end

  describe "#initialize" do
  	
  	it "returns an empty board with 6 rows" do
  	  expect(@board.count).to eq 6
  	end

  	it "returns an empty board with 7 columns on each row" do
  	  expect(@board[0].size).to eq 7
  	  expect(@board[1].size).to eq 7
  	  expect(@board[2].size).to eq 7
  	  expect(@board[3].size).to eq 7
  	  expect(@board[4].size).to eq 7
  	  expect(@board[5].size).to eq 7
  	end

  	it "returns the round in the beggining" do
  	  expect(@round).to eq 0
  	end

  	it "creates player1 with symbol 'X'" do
  	  expect(@player1).to eq "X"
  	end

  	it "creates player2 with symbol 'O'" do
  	  expect(@player2).to eq "O"
  	end

  	it "sets first player as player1" do
  		expect(@current_player).to eq @player1
  	end

  end

  describe "#tick_box" do

  	it "lets current player tick a box with positions of 0,0" do
  		allow(@move = @cf.tick_box(0,0))
  		expect(@board[0][0]).to eq "X"
  	end

  	it "lets second player in 2nd round tick a box with positions of 5,6" do
  		allow(@current_player = @player2)
  		allow(@move = @cf.tick_box(5,6, @current_player))
  		expect(@board[5][6]).to eq "O"
  	end

  	it "does not allow for a change in the board if the box is not empty" do
  		allow(@board[0][0] = "X")
  		expect(@cf.tick_box(0,0)).to eq "You are not allowed to make that move"
  	end
  end

end