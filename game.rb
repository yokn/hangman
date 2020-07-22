# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require 'json'

class Game
  def initialize
    @wrong_guesses = []
    @lives = 8
    @secret_word = ''
    @player = Player.new
    @board = Board.new
  end

  def setup_game
    unless resume?
      generate_secret_word
      @board.setup_board(@secret_word)
    end
    play_game
  end

  def generate_secret_word
    @words_file = File.open('5desk.txt', 'r')
    rand(61_404).times { @words_file.readline }
    @secret_word = @words_file.readline.gsub(/\s/, '') until @secret_word.length > 4 && @secret_word.length < 13
    @secret_word = @secret_word.upcase.split('')
  end

  def check_guess(guess)
    @correct_guess = false
    @secret_word.each_with_index do |value, index|
      if value == guess
        @board.reveal_char(value, index)
        @correct_guess = true
      end
    end
    @wrong_guesses.push(guess) unless @correct_guess || @wrong_guesses.include?(guess)
    @lives -= 1 unless @correct_guess
  end

  def play_game
    while @lives.positive? && !@board.full?
      @board.display_board(@lives, @wrong_guesses)
      check_guess(@player.get_guess)
      unless @lives.zero?
        save_game
        puts 'Autosaved!'
      end
    end
    puts "The secret word was: #{@secret_word}"
    puts @board.full? ? 'You won!' : 'You lost!'
  end

  def save_game
    @game_state = { secret_word: @secret_word,
                    wrong_guesses: @wrong_guesses,
                    lives: @lives,
                    board: @board.board_array }
    File.write('savedgame.json', JSON.pretty_generate(@game_state))
  end

  def load_game
    @loaded_state = JSON.parse(File.read('savedgame.json'))
    # Took me like 20 minutes to figure out why I couldn't read any of the values from the hash...
    # https://stackoverflow.com/a/11381424
    @secret_word = @loaded_state['secret_word']
    @wrong_guesses = @loaded_state['wrong_guesses']
    @lives = @loaded_state['lives']
    @board.board_array = @loaded_state['board']
  end

  def resume?
    puts 'Do you want to load the previous game? (true/false)'
    load_game if gets.chomp == 'true'
  end
end
