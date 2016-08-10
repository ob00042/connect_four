class ConnectFour

	attr_accessor :board, :round, :player1, :player2, :current_player

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
  	i = 0
  	while i < 
  end

end