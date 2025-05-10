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

  def get_input
    gets.chomp.upcase
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def reset_game
    puts "Would you like to play again? Y/N"
    response = get_input

    if response == "Y"
      Game.new.play_game
    else
      puts "Thanks for playing!"
      exit
    end
  end

  def congratulate_winner
    @board.display_board
    puts "Congratulations, #{@current_player.name}!"
    reset_game
  end

  def play_round
    @board.display_board

    row_input = nil
    loop do
      puts "#{@current_player.name}, choose a row:"
      row_input = get_input

      case row_input
      when 'GOOD GAME'
        switch_player
        return congratulate_winner
      when 'EXIT'
        puts "Thanks for playing!"
        exit
      when 'A', 'B', 'C'
        break
      else
        @board.display_board
        puts "#{@current_player.name}, choose a valid row:"
      end
    end

    column_input = nil
    loop do
      puts "#{@current_player.name}, choose a column:"
      column_input = get_input

      case column_input
      when 'GOOD GAME'
        switch_player
        return congratulate_winner
      when 'EXIT'
        puts "Thanks for playing!"
        exit
      when '1', '2', '3'
        break
      else
        @board.display_board
        puts "#{@current_player.name}, choose a valid column:"
      end
    end

    row, column = Board.convert_coordinates_to_indices(row_input, column_input)
    @board.place_game_piece(@current_player.game_piece, row, column)

    if @board.grid[row][column] == @current_player.game_piece
      if @board.winner?(@current_player.game_piece)
        congratulate_winner
      else
        switch_player
      end
    end
  end

  def play_game
    show_instructions
    9.times do
      play_round
      if @board.winner?(@current_player.game_piece)
        congratulate_winner
      end
    end

    @board.display_board
    puts 'Cat\'s Game!'
    reset_game
  end
end