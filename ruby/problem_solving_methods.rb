
#Method declarations
#Iterate through the array
array = [42, 89, 23, 1]

def search_array(array, num)
  i = 0
  match = nil
  array.each do | index |
    if index == num
      match = i
    else
     i += 1
    end
  end
  p match
end

search_array(array, 1)
search_array(array, 22)

  #Check to see if the current iterations matches the integer parameter to search for

  #If there is a match, print the index value of it's location in the array
  #Otherwise, return nil









