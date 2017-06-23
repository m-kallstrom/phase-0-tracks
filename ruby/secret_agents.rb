
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
