# frozen_string_literal: true

class Board
  def initialize
    @board_array = []
  end

  def setup_board(secret_word)
    puts secret_word
    secret_word.each_with_index do |_value, index|
      @board_array[index] = ' _'
    end
    # puts ''
    # puts ''
    # p @board_array
  end

  def display_board(lives, wrong_guesses)
    puts "You have #{lives} lives left!"
    puts wrong_guesses
    p @board_array
  end

  def reveal_char(char, index)
    @board_array[index] = char
  end

  def not_full?
    @board_array.include?(' _')
  end
end
