# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  def initialize
    @wrong_guesses = []
    @lives = 8
    @secret_word = ''
    @player = Player.new
    @board = Board.new
  end

  def setup_game
    # resume?
    generate_secret_word
    play_game
  end

  def generate_secret_word
    @words_file = File.open('5desk.txt', 'r')
    rand(61_404).times { @words_file.readline }
    @secret_word = @words_file.readline.gsub(/\s/, '') until @secret_word.length > 4 && @secret_word.length < 13
    p @secret_word
    @secret_word = @secret_word.split
  end

  def check_guess(guess)
    @secret_word.each_with_index do |value, index|
      if value == guess
        reveal_char(index)
      else
        @lives -= 1
        @wrong_guesses.push(guess)
      end
    end
  end

  def play_game
    while @lives.positive?
      check_guess(@player.get_guess)
      @board.display_board
    end
    puts 'Game Over!'
  end
end
