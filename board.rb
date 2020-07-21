# frozen_string_literal: true

class Board
  def initialize; end

  def display_board(secret_word, lives)
    puts secret_word
    puts "You have #{lives} lives left!"
    secret_word.each do |_value|
      print ' _'
    end
    puts ''
    puts ''
  end
end
