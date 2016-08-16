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

  def tick_box(x, player = @current_player)
  	i = 5
  	while i > -1
  		if @board[i][x] == "-"
  			@board[i][x] = player
  			return
  		else
  			i -= 1
  		end
  	end
  	return
  end

  def check_win
  	
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
  	    else
  	     	@winner = false
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
  			else
  				@winner = false
  			end
  			row += 1
  		end
  		column += 1
  	end

  	row = 0 #diagonals
  	while row < 6
  		column = 0
  		diagonal_count = 0
  		while column < 7
  			if @board[row][column] == @current_player
  				i = 1
  				count1, count2, count3, count4 = 1, 1, 1, 1
  				while i < 4

  					if !@board[row+i][column+i].nil? && count1 > 0 && @board[row+i][column+i] == @current_player
  						count1 += 1
  					else
  						count1 = 0
  					end
  					if count1 == 4
  						@winner = @current_player
  						return @winner
  					else
  						@winner = false
  					end

  					if !@board[row-i][column-i].nil? && count2 > 0 && @board[row-i][column-i] == @current_player
  						count2 += 1
  					else
  						count2 = 0
  					end
  					if count2 == 4
  						@winner = @current_player
  						return @winner
  					else
  						@winner = false
  					end

  					if !@board[row+i][column-i].nil? && count3 > 0 && @board[row+i][column-i] == @current_player
  						count3 += 1
  					else
  						count3 = 0
  					end
  					if count3 == 4
  						@winner = @current_player
  						return @winner
  					else
  						@winner = false
  					end

  					if !@board[row-i][column+i].nil? && count4 > 0 && @board[row-i][column+i] == @current_player
  						count4 += 1
  					else
  						count4 = 0
  					end
  					if count4 == 4
  						@winner = @current_player
  						return @winner
  					else
  						@winner = false
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

end