class Puppy

  def speak(number)
    number.times {puts "Woof!"}
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(human_years)
    human_years * 7
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def play_dead
    puts "Oh, no! I am ded."
    sleep 5
    puts "No, I'm not. Give me a biscuit!"
  end


end

#DRIVER CODE

buddy = Puppy.new
buddy.fetch("ball")
buddy.speak(3)
buddy.roll_over
puts buddy.dog_years(5)
buddy.play_dead

