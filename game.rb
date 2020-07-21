# frozen_string_literal: true

class Game
  def initialize
    @guesses = []
    @lives = 2
    @secret_word = ''
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
  end

  def play_game
    while @lives.positive?
      puts 'here'
      puts 'placeholder'
      @lives -= 1
    end
  end
end
