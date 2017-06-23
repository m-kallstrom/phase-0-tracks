
=begin
def encrypter(encrypt_word)
index = 0
while index < encrypt_word.length
  if encrypt_word[index] == "z"
    puts "a"
  else
  encrypt_word[index] = encrypt_word[index].next!
  puts encrypt_word[index]
  end
  index += 1
end
end

puts encrypter("abc")

puts encrypter("zed")
=end


def decrypter(decrypt_word)
  index = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  decrypted = ""
  while index < decrypt_word.length
    if decrypt_word[index] == "a"
      decrypted += "z"
    else
      decrypted +=
    end
  end
  index += 1
end

puts decrypter("zzz")
puts decrypter("zzz")



#  How can you find out where a letter is in the alphabet, then access the letter right before it? Hint: In the IRB session above, you learned how to ask a string for the index of a letter. "abcdefghijklmnopqrstuvwxyz" counts as a string.
