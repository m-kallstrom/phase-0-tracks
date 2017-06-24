#METHOD DECLARATIONS:

#Takes in a string and moves each letter forward one position in the alphabet.
def encrypter_program(password)
  index = 0
  #declare empty variable for encrypted string
  encrypted = ""
  #loop through all the string's letters
    while index < password.length
      if password[index] == "z"
         encrypted += "a"
      elsif password[index] == " "
        encrypted += " "
      else
         password[index] = password[index].next!
         encrypted += password[index]
      end
      index += 1
    end
 p encrypted
end

=begin
puts encrypter_program("abc")
puts encrypter_program("zed")
puts encrypter_program("swordfish")
puts encrypter_program("secret agent man")
=end

#Takes in a string and moves each letter back one position in the alphabet.
def decrypter_program(password)
  index = 0
  #used for getting a letter's position within the alphabet:
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  #empty variable for newly decrypted string:
  decrypted = ""
  #empty variable to calculate new index number to change the letter:
  new_index_num = ""
  #loop through all letters in the string:
  while index < password.length
    if password[index] == "a"
      decrypted += "z"
    elsif password[index] == " "
      decrypted += " "
    else
       new_index_num = alphabet.index(password[index]) - 1
       decrypted += alphabet[new_index_num]
    end
    index += 1
  end
  p decrypted
end

=begin
puts decrypter_program("bcd")
puts decrypter_program("afe")
puts decrypter_program("txpsegjti")
puts decrypter_program("tfdsfu bhfou nbo")


p decrypter_program(encrypter_program("swordfish"))
# This returns the original string because it first runs the encrypter, which changes each letter forward one position, and then it runs that result through the decrypter, which changes each letter back one position. But it requires you use p rather than puts!
=end


#DRIVER CODE

#Ask a secret agent whether they would like to decrypt or encrypt a password:
puts "Greetings, Agent. Which do you want to do: encrypt or decrypt?"
program = gets.chomp

#Ask them for the password:
puts "What is the password you're using?"
password = gets.chomp

#Conducts the requested operation, prints the results to the screen and exits:
if program == "encrypt"
  p encrypter_program(password)
elsif program == "decrypt"
  p decrypter_program(password)
else
  puts "Whoa, there. I thought we hired agents who can type. Try again from the beginning. I ain't putting in another loop for you."
end
puts "This program will self destruct in 5...4...3...2...1..."