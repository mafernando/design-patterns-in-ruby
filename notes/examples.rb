require 'pry'

# Environment Notes
# **'p' is equivalent to 'puts foo.inspect'
# *** when specifying a required gem, make sure to use quotes NOT backticks - otherwise ruby will hang

# Fixnums and Bignums

x= 3
y= 4
sum = x+y
product = x*y
p sum
p product

6/3 # Is 2
7/3 # Is still 2
8/3 # 2 again
9/3 # Is 3 finally!

p 2.class                 # A Fixnum
p 437.class               # A Fixnum
p (2**437).class          # Very definitely a big Bignum
p 1234567890.class        # Another Bignum
p (1234567890/1234567890) # Divide 2 Bignums, and get 1, a Fixnum

# composing Fixnum and Bignum results in Bignum even if the result is explicitly an integer
0.5*10  # Is 5.0, Bignum
1.0*1   # Is 1.0, Bignum

# Truth, Lies, and Nil
# DPiR_page: 28

p 1 == 1 # true
p 1 == 2 # false
p 'russ' == 'smart' # false
p (1 < 2) # true
p (4 > 6) # true

a = 1
b = 10000
p a > b # false

p 4 >= 4 # true
p 1 <= 2 # true

p (1 == 1) and (2 == 2) # true
p (1 == 1) and (2 == 3) # false

p (1 == 1) && (2 == 2) # true
p (1 == 1) && (2 == 3) # false

p (not(1 == 2))  # true
p !(1 == 1)     # true
p (not(false))     # true

p (true and 'fred') # fred (Note: while considered "true" will print as 'fred' - last value returned)
p ('fred' && 44)    # 44 (Note: while considered "true" will print as 44 - last value returned)
p (nil || false)    # false

if 0
  puts 'Zero is true!' # Note: zero is considered true in ruby
end

# Decisions, Decisions
# A simple example demonstrating if and elsif statements
# DPiR_page: 31

weight = 20

if weight < 1
  p 'very light'
elsif weight < 10
  p 'a little heavy'
elsif weight < 100
  p 'heavy'
else
  p 'way too heavy'
end

p 'a little heavy' if weight >= 10 # can hang conditional off of one line executable statment

unless weight > 100
  p 'not too heavy'
end

# Loops
# 3 main flavors of loops: while, until and for
# for is generally avoided in favor of each syntax
# DPiR: 32

# Example of while syntax usage
i = 0
while i < 4
  p "i = #{i}"
  i += 1
end

# Example of until syntax usage
i = 0
until i >= 4
  p "i = #{i}"
  i += 1
end

# Example of for syntax usage
array = ['first', 'second', 'third']
for element in array
  p element
end

# Example of break and each syntax usage
names = ['george', 'mike', 'gary', 'diana']
names.each do |name|
  if name == 'gary'
    p ('Break!')
    break
  end
  p (name)
end

# Example of next syntax
names.each do |name|
  if name == 'gary'
    p 'Next!'
    next
  end
  p name
end

# Strings
# DPiR: 34

# can define strings with single and double quotes
first = 'Mary had'
second = " a little lamb"

# concatenation
poem = first + second

# example string function
p (first.length)     # Prints 8
p (poem.upcase)
p (poem.downcase)

# example of treating a string like an array
# indexed from 0
poem[0] = 'G' # prints out Gary + poem
p poem

# can overwrite index with variable length string
poem[1] = 'rego' # prints out G[rego]ry + poem
p poem

# string interpolation example
n = 42
p "The value of n is #{n}."

# string interpolation also allows for complex ruby code to be evaluated
city = 'Washington'
temp_f = 84
puts("The city is #{city} and the temp is #{5.0/9.0 * (temp_f-32)} C")

# generates multi-line value with parity to double (capital Q) quoted strings
a_multiline_string = %Q{
The city is #{city}.
The temp is #{5.0/9.0 * (temp_f-32)} C
}

# generates multi-line value with parity to single quoted strings
# the following result is not interpolated
a_multiline_string = %q{
The city is #{city}.
The temp is #{5.0/9.0 * (temp_f-32)} C
}

# ruby strings are not immutable
name = 'russ'
first_name = name
name[0] = 'R'
p name
p first_name

# Symbols: essentially immutable identifier type things
# - symbols only start with colons
# DPiR: 37

x = :foo
p x.class # Symbol

# Arrays
# DPiR: 38

x = []  # an empty array
y = Array.new # another one
a = [ 'neo',  'trinity',  'tank'] # a three-element array

# ruby arrays are indexed from zero
a[0]  # neo
a[2]  # tank

# array length
p a.length  # is 3
p a.size    # is also 3

# appending elements beyond end index generates intermediate indices with nil
a[6] = 'keymaker'
p a[4]
p a[5]
p a[6]

# simple way to append an element to the end of an array without referencing end index
# NOTE: array elements are also dynamically typed
p a << 'mouse'

# a common ruby convention is to return a NEW object from
# an undecorated (no end bang) method and to modify the original
# object when the method is decorated with an end bang
# e.g. sort vs sort!

a = [77, 10, 120, 3]
a.sort    # a [3, 10, 77, 120] - undecorated method example, no end bang
p a       # a is unchanged [ 77, 10, 120, 3] - undecorated method example, no end bang

a.reverse # a [3, 120, 10, 77] - undecorated method example, no end bang
p a       # a is unchanged [ 77, 10, 120, 3] - undecorated method example, no end bang

a.sort!     # a is now [3, 10, 77, 120]
a.reverse!  # a is now [120, 77, 10, 3]
p a         # a is [ 77, 10, 120, 3] - note the end bangs

# Hashes
# DPiR: 40

# example hash declaration
h = {}
h['first_name'] = 'Albert'
h['last_name'] = 'Einstein'
p h['first_name'] # is 'Albert'
p h['last_name']  # is Einstein

# hash shortcut initialization with strings and symbols (preferred)
p h = {'first_name' => 'Albert', 'last_name' => 'Einstein'}
p h = {:first_name => 'Albert', :last_name => 'Einstein'}

# Regular Expressions
# DPiR 40

# exmaple regex in ruby
# note that they are contained inside of forwrad slashes
p /old/
p /Russ|Russell/
p /.*/

# example use of the =~ operator to apply regex to strings
# the operator will return the index of first occurrence or nil
p /old/ =~ 'this old house'  # 5 - the index of 'old'
p /Russ|Russell/ =~ 'Fred'   # nil – Fred is not Russ nor Russell
p /.*/ =~ 'any old string'   # 0 - the RE will match anything

# !~ complements =~ by returning true if the
# regex does NOT match the searched string
# and false otherwise
p /cat/ !~ 'dog' # true
