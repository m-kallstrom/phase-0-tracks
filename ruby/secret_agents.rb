
def encrypter_program(password)
index = 0
encrypted = ""
  while index < password.length
    if password[index] == "z"
       encrypted += "a"
    else
       password[index].next!
       encrypted += password[index]
    end
    index += 1
  end
  puts encrypted
end


puts encrypter_program("abc")
puts encrypter_program("zed")
puts encrypter_program("swordfish")



def encrypter_program(password)
index = 0
encrypted = ""
  while index < password.length
    if password[index] == "z"
       encrypted += "a"
    else
       password[index].next!
       encrypted += password[index]
    end
    index += 1
  end
  puts encrypted
end


puts encrypter_program("abc")
puts encrypter_program("zed")
puts encrypter_program("swordfish")


def decrypter_program(password)
  index = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  decrypted = ""
  new_index = ""
  while index < password.length
    if password[index] == "a"
      decrypted += "z"
    else
       new_index = alphabet.index(password[index])
       new_index = new_index - 1
       decrypted += alphabet[new_index]
    end
    index += 1
  end
  puts decrypted
end


puts decrypter_program("bcd")
puts decrypter_program("afe")
puts decrypter_program("txpsegjti")
