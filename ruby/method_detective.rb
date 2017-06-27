# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

# .replace("new string") is the culprit because it's the only one that could have committed all these crimes.


p "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

p "zom".insert(2, 'o')
# => “zoom”

p "enhance".center(15, padstr=' ')
p "enhance".rjust(11).ljust(15)
# => "    enhance    "

p "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

p "the usual" << " suspects"
p "the usual".insert(-1, ' suspects')
#=> "the usual suspects"

p " suspects".prepend("the usual")
p " suspects".insert(0, 'the usual')
# => "the usual suspects"

p "The case of the disappearing last letter".chomp("r")
p "The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"

p "The mystery of the missing first letter".delete("T")
p "The mystery of the missing first letter"[1..-1]
p "The mystery of the missing first letter".slice(1..-1)
# => "he mystery of the missing first letter"

p "Elementary,    my   dear        Watson!".squeeze(" ")
# => "Elementary, my dear Watson!"

p "z".each_byte {|c| print c, ' ' }
p "z".ord
p "z".gsub(/./) {|s| s.ord.to_s}
# => 122

p "How many times does the letter 'a' appear in this string?".count("a")
# => 4

