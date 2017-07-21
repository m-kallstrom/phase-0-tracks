# Virus Predictor

# I worked on this challenge [by myself, with: Marla Kallstrom and Davina].
# We spent [1.2] hours on this challenge.

# EXPLANATION OF require_relative
#---It is used to link a file that is in the same folder
#---as the current file.
require_relative 'state_data'

class VirusPredictor
    #--Setting instance variables for each new class instance
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
    #--Literally just calling predicted_deaths and speed_of_spread,
    #--probz just to simplify the user interface code.

  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private
    #--Calculates how many people are gonna die, based on
    #--the total population multiplied by a population density
    #--variable.
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      multiplier = 0.4
    elsif @population_density >= 150
      multiplier = 0.3
    elsif @population_density >= 100
      multiplier = 0.2
    elsif @population_density >= 50
      multiplier = 0.1
    else
      multiplier = 0.05
    end
    number_of_deaths = (@population * multiplier).floor
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end
    #--Based on population density, this method just states, in months,
    #--how long it will take for the disease to spread.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end
    puts " and will spread across the state in #{speed} months.\n\n"
  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


STATE_DATA.each do |state, value|
  state = VirusPredictor.new(state, value[:population_density], value[:population])
  state.virus_effects
end

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section

#What are the differences between the two different hash syntaxes shown in the state_data file?

#--One uses the hash rocket to make key/value pairs and the more nested one uses symbols.


#What does require_relative do? How is it different from require?

#--Require_relative links the current document with another document in the same folder. If it had been 'require', then the path to that document would have to be specified rather than just the file name.


#What are some ways to iterate through a hash?

#--You can use .each to iterate through a hash, using the keys and values to reach into the nested hash. You could also use .map or some other built in method depending on what your needs were.


#When refactoring virus_effects, what stood out to you about the variables, if anything?

#--It seemed odd to need them repeated so often, but then we eventually realized that the parameter variables weren't even being used in the methods--it was all instance variables.


#What concept did you most solidify in this challenge?

#--This was good practice for thinking out loud through different solutions. This helped solidify accessing nested hashes. I also learned about refactoring for greater human readability rather than just decreasing the number of lines in a program.