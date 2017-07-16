#Solo Challenge

class Wordgame
attr_reader :letters_checked
attr_accessor :hidden_array

  def initialize(word_to_be_guessed)
    @word_array = word_to_be_guessed.split("")
    @guess_count = 0
    @letters_checked = []
    @hidden_array = []
  end


  def check_letter(letter_guessed)
    if @word_array.include?(letter_guessed)
      guess = true
    else
      guess = false
    end
  end


end

hangman = Wordgame.new("apple")


#Declare a game class
#reader access: word to be guessed, letter being guessed,
#reader/writer access: guess count, word being revealed?

#initialize and get a word from the user

#change the output of the word based on correct guesses

#method to change guess count, decide guess count, and allow for multiple attempts at the same guess without counting against the user

#Driver code
#Greet users
#ask one to input a word
#ask another to guess the word
#display revealed letters and number of guesses left
#congratulate if won, taunt if lost


