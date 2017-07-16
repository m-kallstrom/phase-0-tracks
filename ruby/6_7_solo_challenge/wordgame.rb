#Solo Challenge

class Wordgame
  attr_reader(:letters_checked, :guess_count)

  def initialize(word_to_be_guessed)
    @word_array = word_to_be_guessed.split("")
    @guess_count = 0
    @letters_checked = []
    @hidden_array = []
  end

  def hide_letters
    @word_array.length.times { @hidden_array << " _ " }
    @hidden_array
  end

  def check_letter(letter_guessed)
    if @word_array.include?(letter_guessed)
      guess = true
    else
      guess = false
    end
  end

  def letter_reveal(letter_guessed)
    @index = 0
    @word_array.each do |letter|
      if letter == letter_guessed
        @hidden_array[@index] = letter
      end
      @index +=1
    end
    @hidden_array
  end

  def guess_counter
   case
    when @word_array.length >=20 then guess_count = 10
    when @word_array.length >3 && @word_array.length <20 then guess_count = 11
    when @word_array.length <= 3 then guess_count = 12
    end
   return guess_count
  end

  def game_over?
    if @letters_checked == @guess_count
      taunter
    end
  end

  def taunter
    if @hidden_array.include?(" _ ")
      p "You get NOTHING! You LOSE! GOOD DAY, SIR!"
    else
      p "Awesome job!"
    end
  end


  def update_counter(letter_guessed)
    if @letters_checked.include?(letter_guessed)
      @letter_checked.length
    else
      @letters_checked << letter_guessed
      @letters_checked.length
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


