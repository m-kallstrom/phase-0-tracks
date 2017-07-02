#METHODS

def alias_maker(agent_name)
  agent_name.split(' ')

end

p alias_maker("Felicia Torres")


#Take in string of first and last name
#Split string into an array of two values using the space as a divider
#Take each individual value and break it into an array of letters
#Analyze the letters based on whether they're vowels or consonants
  #-If vowel, move one vowel forward
  #-If consonant, move one consonant forward
  #-LOL if y then do at random
#Put the letters back together
#Put the first and last name back together in the opposite order they started in.

=begin
Swapping the first and last name.
Changing all of the vowels (a, e, i, o, or u) to the next vowel in 'aeiou', and all of the consonants (everything else besides the vowels) to the next consonant in the alphabet. So 'a' would become 'e', 'u' would become 'a', and 'd' would become 'f'.

If you get really and truly stuck, just write an alias method that loops through the original name and changes the letters somehow, without worrying about implementing this particular algorithm. It's really not worth stressing about. Simply attempting the algorithm will help you improve, even if you didn't quite get there.

This is the most complex algorithm you've had to write, and the toughest release of this challenge. How will you break it down into manageable pieces? Try to identify all of the mini-challenges and considerations that show up in your algorithm, such as

When will it be helpful to convert the string to an array to work with it more easily?
How will you figure out whether a letter is a vowel?
How will you deal with the fact that some letters are uppercase?
How will you handle edge cases?
You may find it helpful to write additional methods -- one for each job -- and then combine them. It's less overwhelming, for instance, to start converting your algorithm to code by writing a next_vowel method that takes a vowel character and returns the next vowel character. Once you know that small piece works because you've tested it with a few different vowels, you can use it in your program and trust that it's unlikely to be the source of any bugs that come up. This is a great way to make steady progress.

If you do successfully implement the algorithm, "Felicia Torres" will become "Vussit Gimodoe", which is a rather odd name. Luckily, our dearest Vussit is from a country no one has ever heard of, mainly because it doesn't really exist.
=end
