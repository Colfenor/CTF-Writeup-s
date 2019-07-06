# bb playing around
# "decrypt" function ;)
# plain text should be "haha"
require"base64"
# str encrypted
#testDummy ="KWzxE6JKUr9Z1hvmje9CIt9mB3huk7BBNxuhAYixQst8H///////////xgLGAw=="
str ="K7sAYzGlYx0kZyXIIPrXxK22DkU4Q+rTGfUk9i9vA60C/ZcQOSWNfJLTu4RpIBy/27yK5CBW+UrBhm0="
enB = Base64.decode64(str)

# scan(/./)
# splits the string into desired array format
# and .map(&:ord) converts from char code
# into hexadecimal
# .collect{ |num| "02X" % num} converts from dec to char
ah = enB.scan(/./).map(&:ord).collect{|num| "%02X" % num}.join

#.map({|x|x.ord}) map means "do" for every element
#print ah
revC = ah.to_i(16) #integer base 16

#print revC
# i was just trying stuff out, i do not have a full
# understanding of what the heck is going on here
# but apparently that's how you reverse the initial cycle
# step :D
revX = revC/['5'].cycle(101).to_a.join.to_i

print revX

print "------------------------------\n"

revH = revX.to_s(16)

# here we have the hex values of our "encrypted" stuff
revH = revX.to_s(16).scan(/../).collect{|num| "0x" + num}

print revH
# let's get ready to find out what you look like
# sweet flag :)
plain_text = revH.collect{|num| num.to_i(16).chr}.join

print "------------------------------\n"
print plain_text
#puts 0x68.chr


=begin
i = 0
loop do
  revC -= 875607088
  puts revC
  if i == 100
    break
  end
end
=end
