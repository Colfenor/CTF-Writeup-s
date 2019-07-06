

## 03 - Sloppy Encryption

From my point of view as a beginner,
this was a really fun and tricky challenge :)

So you are given a string of a total of 80 individual 
characters ending with a " = " Symbol.

voilá: 
* K7sAYzGlYx0kZyXIIPrXxK22DkU4Q+rTGfUk9i9vA60C/ZcQOSWNfJLTu4RpIBy/27yK5CBW+UrBhm0=

and most importantly a sloppy.rb file which apparently holds the encryption logic implemented in
the programming language ruby !:)

<img src="solved.png" alt="PAINTU tool menu" width="60%" height="60%">

I decided to tackle this challenge by stepwise disecting the ruby code and to see what each 
ruby statement does with a given input.

The "lost" ruby script in question:
```
require"base64"
puts"write some text and hit enter:"
input=gets.chomp
h=input.unpack('C'*input.length).collect{|x|x.to_s(16)}.join
ox=('%#X' % (h.to_i(16)))
x=ox.to_i(16)*(['5'].cycle(101).to_a.join.to_i)
c=x.to_s(16).scan(/../).map(&:hex).map(&:chr).join
b=Base64.encode64(c)
puts"encrypted text:""#{b}"
```

I used a test input: "hihi"

Starting with `input=gets.chomp` gets.chomp removes the line break read by gets

`h=input.unpack('C'*input.length).collect{|x|x.to_s(16)}.join`

Then the .unpack method is called which apparently seems to convert the individual
string characters into their ASCII decimal value (e.g character'a' to decimal 97)
& the individual number "collected" is converted to a string
#hexadecimal via .to_s(16) and joined to an single string via the .join method

`ox=('%#X'%(h.to_i(16)))`

this line of code, basically seems to add 0X to the start of the string which
is converted into an int via ".to_i()"
puts "hey ox #{ox}" # hex -> 0X68616861 which is 1751214177 in dec
