
#Declare module for emphasizing text
  #declare method for angry emphasis
  #declare method for happy emphasis

module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words + "!!!" + ":D!"
  end
end

#Add a class that would use the shout module angrily
class Jerk_on_Subway
  include Shout
end

#Add a class that would use the shout module happily
class Friend
  include Shout
end

#Initialize some new instances and give them something to say
speech = "OMG"
aggressive_hobo = Jerk_on_Subway.new
new_coding_buddy = Friend.new

#test it works
p aggressive_hobo.yell_angrily(speech)
p aggressive_hobo.yell_happily(speech)
p new_coding_buddy.yell_happily(speech)
p new_coding_buddy.yell_angrily(speech)


