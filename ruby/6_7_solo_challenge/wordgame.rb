#Solo Challenge

#declare a game class
class Wordgame

  #Initialize a new instance of the game
    #split the word into an array
    #declare variables
  def initialize(word_to_be_guessed)
    @word_array = word_to_be_guessed.split("")
    @guess_count = 0
    @letters_checked = []
    @hidden_array = []
  end

  #Add a bunch of dots to hide what word was input by the first user
  def word_input_hider
    puts "
      ." * 25
  end

  #Determine how many guesses to give the user
    #assign based on the length of the array
  #output the number of guesses allowed
  def guess_counter
   case
    when @word_array.length >=20 then @guess_count = 10
    when @word_array.length >3 && @word_array.length <20 then @guess_count = 11
    when @word_array.length <= 3 then @guess_count = 12
    end
   return @guess_count
  end

  #Take the word array and make an array of " _ " of the same number of characters
  #IF there is a space, restore the space to the array
  #output the obscured array
    def hide_letters
    if @word_array.include?(" ")
      @index = 0
      @word_array.length.times { @hidden_array << " _ " }
      @word_array.each do |letter|
        if letter == " "
          @hidden_array[@index] = " "
        end
        @index += 1
      end
      array_beautifier
    else
    @word_array.length.times { @hidden_array << " _ " }
    array_beautifier
    end
  end

  #Check the letter the user enters
    #IF the letter is in word_array
      #call the letter revel method
      #update the guess counter
    #update the guess counter
    #output the changed hidden_array
  def check_letter(letter_guessed)
    if @word_array.include?(letter_guessed)
      puts "Yep! We've got some of that!"
      letter_reveal(letter_guessed)
      update_counter(letter_guessed)
      array_beautifier
    else
      puts "Nope! Sorry!"
      update_counter(letter_guessed)
      array_beautifier
    end
  end

  #Change the hidden_array to reveal guessed letter
    #set an index to 0
    #iterate through the word_array and change any correct letter
    #output the updated hidden_array
  def letter_reveal(letter_guessed)
    @index = 0
    @word_array.each do |letter|
      if letter == letter_guessed
        @hidden_array[@index] = letter
      end
      @index +=1
    end
    array_beautifier
  end

  #Print out a nice string for the hidden_array
  def array_beautifier
    @pretty_string = ""
    @hidden_array.each { |character| @pretty_string += character }
    @pretty_string
  end

  #Update the unique guess counter
    #IF the letter has been guessed before
      #output the length of the letters_checked array
    #ELSE
      #add the letter to the letters_checked array
    #output the length of the letters_checked array
  def update_counter(letter_guessed)
    if @letters_checked.include?(letter_guessed)
      @letters_checked.length
    else
      @letters_checked << letter_guessed
      @letters_checked.length
    end
  end

  #Check if the game is over
    #IF the word_array matches the hidden_array
      #the game is over
      #trigger an end message
    #ELSE
      #IF the letters_checked array is the same as the allowed guess_count
        #the game is over
        #trigger an end message
      #ELSE game on
    #output a true/false
  def game_over?
   if @word_array == @hidden_array
     @game_over = true
     taunter
   else
     if @letters_checked.length == @guess_count
       @game_over = true
       taunter
     else
       @game_over = false
     end
   end
  end

  #Praise or taunt the user based on whether they solved the puzzle in time
  def taunter
    if @hidden_array.include?(" _ ")
      p "You get NOTHING! You LOSE! GOOD DAY, SIR!"
    else
      p "Awesome job! I knew you could do it!"
    end
  end
end

hangman = Wordgame.new("apple")

#DRIVER CODE
#Ask for word input
  #initialize new instance
  #convert to hidden array
  #determine number of guesses allowed
  #print the obscured array to the console
#UNTIL the whole word is revealed or they run out of guesses
  #ask user to guess a letter
    #IF the letter is in the word
      #reveal the letter
    #increase the used guess count for each unique guess
#Print either an insulting or congratulatory message, depending on whether they won

=begin

puts "Hey! Wanna play hangman? But without hanging a man? Even a digital one? This version is Conscience Lite!"
puts "Enter a word for your partner to guess!"
input = gets.chomp
hangman = Wordgame.new(input)
hangman.guess_counter
hangman.word_input_hider
p hangman.hide_letters

puts "Okay! Don't look above. Guess a letter!"
while !hangman.game_over?
  input = gets.chomp
  hangman.check_letter(input)
  hangman.game_over?
end

=end

