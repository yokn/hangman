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
    @board.setup_board(@secret_word)
    play_game
  end

  def generate_secret_word
    @words_file = File.open('5desk.txt', 'r')
    rand(61_404).times { @words_file.readline }
    @secret_word = @words_file.readline.gsub(/\s/, '') until @secret_word.length > 4 && @secret_word.length < 13
    p @secret_word
    @secret_word = @secret_word.upcase.split('')
    # p @secret_word
  end

  def check_guess(guess)
    @correct_guess = false
    @secret_word.each_with_index do |value, index|
      if value == guess
        @board.reveal_char(value, index)
        @correct_guess = true
      else
        @wrong_guesses.push(guess) unless @wrong_guesses.include?(guess)
      end
    end
    @lives -= 1 unless @correct_guess
  end

  def play_game
    while @lives.positive? && @board.not_full?
      check_guess(@player.get_guess)
      @board.display_board(@lives, @wrong_guesses)
    end
    puts 'Game Over!'
  end
end
