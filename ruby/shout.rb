module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words + "!!!" + ":D!"
  end
end

yell = "Ragh"

p Shout.yell_happily(yell)
p Shout.yell_angrily(yell)