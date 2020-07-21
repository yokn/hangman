# frozen_string_literal: true

class Game
  def initialize
    @guesses = []
    @lives = 2
    @secret_word = ''
  end

  def setup_game
    # resume?
    puts generate_secret_word
    play_game
  end

  def generate_secret_word
    @random_seed = rand(61_404)
    @words_file = File.open('5desk.txt', 'r')
    p @random_seed
    @random_seed.times { @words_file.readline }
    @secret_word = @words_file.readline until @secret_word.length > 4 && @secret_word.length < 13

    # p @secret_word
  end

  def play_game
    while @lives.positive?
      puts 'here'
      p @secret_word
      puts 'placeholder'
      @lives -= 1
    end
  end
end
