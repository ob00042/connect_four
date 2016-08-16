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

  	it "lets current player tick a box with the first position of 0th column" do
  		allow(@move = @cf.tick_box(0))
  		expect(@board[5][0]).to eq "X"
  	end

  	it "stacks the ticked boxes" do
  		allow(@board[5][0] = "X")
  		allow(@move = @cf.tick_box(0))
  		expect(@board[4][0]).to eq "X"
  	end

  end

  describe "#check_win" do

  	it "gives no winner if there is no winner" do
  		expect(@cf.check_win).to be false
  	end

  	it "checks for the current player win if there are 4 same boxes ticked in series" do
  		allow(@board[5][0] = "X")
  		allow(@board[5][1] = "X")
  		allow(@board[5][2] = "X")
  		allow(@board[5][3] = "X")
  		expect(@cf.check_win).to eq @player1
  	end

  	it "checks for the current player win if there are 4 same boxes ticked on top of one another" do
  		allow(@board[5][0] = "X")
  		allow(@board[4][0] = "X")
  		allow(@board[3][0] = "X")
  		allow(@board[2][0] = "X")
  		expect(@cf.check_win).to eq @player1
  	end

  	it "checks for the current player win if there are 4 same boxes ticked in diagonal" do
  		allow(@board[5][0] = "X")
  		allow(@board[4][1] = "X")
  		allow(@board[3][2] = "X")
  		allow(@board[1][3] = "X")
  		expect(@cf.check_win).to eq @player1
  	end

  	# it "checks for the current player win if there are 4 same booxes ticked in the left diagonal" do
  	# 	allow(@board[5][5] = "X")
  	# 	allow(@board[4][4] = "X")
  	# 	allow(@board[3][3] = "X")
  	# 	allow(@board[2][2] = "X")
  	# 	expect(@cf.check_win).to eq @player1
  	# end

  end

end