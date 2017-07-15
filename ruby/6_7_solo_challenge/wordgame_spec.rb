#Solo Challenge

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


=begin
Using plain old English in a text file or other scratch pad, pseudocode a class for a word-guessing game that meets the following specifications. Assume your driver code will handle input and output as far as the user is concerned. In other words, write a class designed for a computer program to use, not one designed for a human to use directly, then use driver code to bridge the gap between human and Ruby object.

One user can enter a word (or phrase, if you would like your game to support that), and another user attempts to guess the word.
Guesses are limited, and the number of guesses available is related to the length of the word.
Repeated guesses do not count against the user.
The guessing player receives continual feedback on the current state of the word. So if the secret word is "unicorn", the user will start out seeing something like "_ _ _ _ _ _ _", which would become "_ _ _ c _ _ _" after the user enters a guess of "c".
The user should get a congratulatory message if they win, and a taunting message if they lose.
=end