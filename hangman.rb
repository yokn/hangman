# frozen_string_literal: true

# Initial Plan:
#   Initialize guesses(Array), lives(Int) and generate a random number between 0 and 61404
#   Open 5desk.txt and read a random line from it
#     If it is not between 5 and 12 characters long, move to the next line
#   Upcase the word and store it in the secret_word array
#   Generate a board with as many underscores as the secret_word's length
#   While lives > 0
#     Ask the player for a character and upcase it
#     secret_word.each_with_index do |value, index|:
#       If value matches the input_char, reveal_value(index)
#       If it doesn't, remove 1 from the lives variable and push the input_char to the guesses array
#
#
#
#
#
