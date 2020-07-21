# frozen_string_literal: true

class Player
  def initialize; end

  def get_guess
    puts 'Please enter a character'
    gets.chomp.upcase
  end
end
