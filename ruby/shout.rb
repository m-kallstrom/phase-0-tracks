
#Declare module for emphasizing text
  #declare method for angry emphasis
  #declare method for happy emphasis

module Shout
  def yell_angrily(words)
    words + "!!!" + " >:("
  end

  def yell_happily(words)
    words + "!!!" + " :D!"
  end
end

#Add a class that would use the shout module angrily
class Jerk
  include Shout
end

#Add a class that would use the shout module happily
class Friend
  include Shout
end

#Initialize some new instances and give them something to say
sound = "OMG"
aggressive_hobo = Jerk.new
new_coding_buddy = Friend.new

#test it works
p "A wild AGGRESSIVE HOBO appeared!"
p aggressive_hobo.yell_angrily(sound)
p "AGGRESSIVE HOBO used ROAR"
p aggressive_hobo.yell_happily("Imma take over this whole subway bench, and then the world")
p "It's not very effective..."
p "A wild NEW CODING BUDDY appeared!"
p new_coding_buddy.yell_happily(sound)
p "NEW CODING BUDDY used NERDY REFERENCE"
p new_coding_buddy.yell_angrily("I can't believe Senses8 just got canceled")
p "It's super effective!"

#Old version for standalone module:
# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " >:("
#   end

#   def self.yell_happily(words)
#     words + "!!!" + " :D!"
#   end
# end
