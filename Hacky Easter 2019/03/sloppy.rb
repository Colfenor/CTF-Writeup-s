
require"base64"
puts"write some text and hit enter:"
input=gets.chomp
h=input.unpack('C'*input.length).collect{|x|x.to_s(16)}.join
ox=('%#X' % (h.to_i(16)))
x=ox.to_i(16)*(['5'].cycle(101).to_a.join.to_i)
c=x.to_s(16).scan(/../).map(&:hex).map(&:chr).join
b=Base64.encode64(c)
puts"encrypted text:""#{b}"



# "decrypt" function ;)
require"base64"
str = "K7sAYzGlYx0kZyXIIPrXxK22DkU4Q+rTGfUk9i9vA60C/ZcQOSWNfJLTu4RpIBy/27yK5CBW+UrBhm0="
enB = Base64.decode64(str)
1751214177
