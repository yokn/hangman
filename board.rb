# frozen_string_literal: true

class Board
  attr_accessor :board_array
  def initialize
    @board_array = []
  end

  def setup_board(secret_word)
    # puts secret_word
    secret_word.each_with_index do |_value, index|
      @board_array[index] = ' _'
    end
    # puts ''
    # puts ''
    # p @board_array
  end

  def display_board(lives, wrong_guesses)
    puts "You have #{lives} lives left!"
    p wrong_guesses
    p @board_array
  end

  def reveal_char(char, index)
    @board_array[index] = char
  end

  def full?
    !@board_array.include?(' _')
  end
end
