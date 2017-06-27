# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

# "iNvEsTiGaTiOn".<???>
# => “InVeStIgAtIoN”
iNvEsTiGaTiOn.capitalize
iNvEsTiGaTiOn.swapcase

# "zom".<???>
# => “zoom”
index doubleing
# "enhance".<???>
# => "    enhance    "
"enhance".center(4, padstr=' ')
"enhance".rjust(4).ljust(4)

# "Stop! You’re under arrest!".<???>
# => "STOP! YOU’RE UNDER ARREST!"
"Stop! You’re under arrest!".upcase

# "the usual".<???>
#=> "the usual suspects"

"the usual".insert(-1, ' suspects')

# " suspects".<???>
# => "the usual suspects"
" suspects".prepend("the usual")
" suspects".insert(0, 'the usual')

# "The case of the disappearing last letter".<???>
# => "The case of the disappearing last lette"
"The case of the disappearing last letter".chomp

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"
"Elementary,    my   dear        Watson!".squeeze(" ")

# "z".<???>
# => 122
# (What is the significance of the number 122 in relation to the character z?)
each_byte {|fixnum| block } → str
each_byte → an_enumerator
Passes each byte in str to the given block, or returns an enumerator if no block is given.

"hello".each_byte {|c| print c, ' ' }
produces:

104 101 108 108 111

or codepoint
or ord → integer


# "How many times does the letter 'a' appear in this string?".<???>
# => 4