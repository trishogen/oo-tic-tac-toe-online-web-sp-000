class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
                      [0,1,2], [3,4,5], [6,7,8], # across
                      [0,3,6], [1,4,7], [2,5,8], # down
                      [0,4,8], [2,4,6] # diagonally
                    ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, token = 'X')
    @board[index] = token
  end

  def position_taken?(index)
    not @board[index] == " "
  end

  def valid_move?(index)
    (0..8).include?(index) & !position_taken?(index)
  end

  def turn_count
    turn_count = @board.size - @board.count(" ")
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    input = gets
    index = input_to_index(input)
    turn if !valid_move?(index)
    move(index, current_player)
    display_board
  end

  def won?
    WIN_COMBINATIONS.find do |v|
      @board.values_at(v[0],v[1],v[2]) == ['X', 'X', 'X'] || board.values_at(v[0],v[1],v[2]) == ['O', 'O', 'O']
    end
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    full? & !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    won? == nil ? nil : @board[won?[0]]
  end

  def play
    turn until over?
    won? ? puts "Congratulations #{winner}!" : puts "Cat's Game!"
  end

end
