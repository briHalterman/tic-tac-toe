class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "X")
    @player2 = Player.new("Player 2", "O")
    @current_player = @player1
  end

  def show_instructions
    puts 'Tic-Tac-Toe'
    puts 'Take turns playing spaces.'
    puts 'Three in a row wins!'
    puts 'Type "Good Game" to concede to your opponent.'
    puts 'Type "Exit" at any point to exit the game'
    puts 'Player 1 starts. Let\'s go!'
    puts
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def reset_game
    puts "Would you like to play again? Y/N"
    response = gets.chomp.upcase

    if response == "Y"
      Game.new.play_game
    else
      puts "Thanks for playing!"
      exit
    end
  end

  def congratulate_winner
    switch_player
    puts "Congratulations, #{@current_player.name}!"
    reset_game
  end

  def play_round
    puts @board.display_board

    puts "#{@current_player.name}, choose a row:"
    row_input = gets.chomp.upcase

    # until ['A', 'B', 'C', 'GOOD GAME', 'EXIT'].include?(row_input)
    #   puts "#{@current_player.name}, choose a valid row:"
    #   row_input = gets.chomp.upcase
    # end

    if row_input == 'GOOD GAME'
      congratulate_winner
    end

    if row_input == 'EXIT'
      puts "Thanks for playing!"
      exit
    end

    puts "#{@current_player.name}, choose a column:"
    column_input = gets.chomp.upcase

    # until ['1', '2', '3', 'GOOD GAME', 'EXIT'].include?(column_input)
    #   puts "#{@current_player.name}, choose a valid column:"
    #   column_input = gets.chomp.upcase
    # end

    if column_input == 'GOOD GAME'
      congratulate_winner
    end

    if column_input == 'EXIT'
      puts "Thanks for playing!"
      exit
    end

    row, column = Board.convert_coordinates_to_indices(row_input, column_input)
    @board.place_game_piece(@current_player.game_piece, row, column)

    if @board.grid[row][column] == @current_player.game_piece
      if @board.winner?(@current_player.game_piece)
        puts @board.display_board
        puts "#{@current_player.name} wins! Congratulations!"
        reset_game
      else
        switch_player
      end
    end
  end

  def play_game
    show_instructions
    9.times do
      play_round
    end
    puts 'Cat\'s Game!'
    reset_game
  end
end