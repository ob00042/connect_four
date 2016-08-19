class ConnectFour

	attr_accessor :board, :round, :player1, :player2, :current_player, :winner

  def initialize
  	@board = []
  	@round = 0
  	@player1 = "X"
  	@player2 = "O"
  	@current_player = @player1
  	6.times do 
  		@board << [ "-" , "-" , "-" , "-" , "-" , "-" , "-" ]
  	end
  	@board
  end

  def tick_box(x)
  	i = 5
  	while i > -1
  		if @board[i][x] == "-"
  			@board[i][x] = @current_player
  			return
  		else
  			i -= 1
  		end
  	end
  	return
  end

  def check_win

  	@winner = false
  	
  	row = 0 #4 straight in series
  	while row < 6 
  		column = 0
  		series_count = 0
  		while column < 7
  		  if @board[row][column] == @current_player
  	      series_count += 1
  	    else
  	    	series_count = 0
  	    end
  	    if series_count == 4
  	    	@winner = @current_player
  	    	return @winner
  	    end
  	    column += 1
  	  end
  	  row += 1
  	end

  	column = 0 # 4 on top of one another
  	while column < 7
  		row = 0
  		top_count = 0
  		while row < 6
  			if @board[row][column] == @current_player
  				top_count += 1
  			else
  				top_count = 0
  			end
  			if top_count == 4
  				@winner = @current_player
  				return @winner
  			end
  			row += 1
  		end
  		column += 1
  	end

  	row = 0 #diagonals
  	while row < 6
  		column = 0
  		while column < 7
  			if @board[row][column] == @current_player
  				i = 1
  				count1, count2, count3, count4 = 1, 1, 1, 1
  				while i < 4 	

  					if count1 > 0 && row + i < 6 && column + i < 7 && @board[row+i][column+i] == @current_player 
  						count1 += 1
  						if count1 == 4
  							@winner = @current_player
  							return @winner
  						end
  					else
  						count1 = 0
  					end

  					if count2 > 0 && row - i > -1 && column -i > -1 && @board[row-i][column-i] == @current_player
  						count2 += 1
  						if count2 == 4
  							@winner = @current_player
  							return @winner
  						end
  					else
  						count2 = 0
  					end

  					if count3 > 0 && row + i < 6 && column - i > -1 && @board[row+i][column-i] == @current_player
  						count3 += 1
  						if count3 == 4
  							@winner = @current_player
  							return @winner
  						end
  					else
  						count3 = 0
  					end

  					if count4 > 0 && row - i > -1 && column + i < 7 && @board[row-i][column+i] == @current_player
  						count4 += 1
  						if count4 == 4
  							@winner = @current_player
  							return @winner
  						end
  					else
  						count4 = 0
  					end

  					i += 1

  				end
  			end
  				column += 1
  			end
  			row += 1
  		end

  	@winner
  	
  end

  def game
  	puts "Let's play Connect Four!"
  	puts "Player1 will have 'X' and Player2 will have 'O'"
  	20.times do
  		@board.each{ |l| p l }
  		if @round % 2 == 0
  			@current_player = @player1
  		else
  			@current_player = @player2
  		end
  		puts "Which column would you like to drop your coin? (0 - 6)"
  		column = gets.chomp
  		tick_box(column.to_i)
  		check_win
  		break if @winner != false
  		@round += 1
  	end

  end

end

cf = ConnectFour.new
cf.game