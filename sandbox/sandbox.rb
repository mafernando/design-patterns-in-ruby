# General Notes
# 'p' is equivalent to 'puts foo.inspect'

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
  puts 'heavy'
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
  puts "i = #{i}"
  i += 1
end

# Example of until syntax usage
i = 0
until i >= 4
  puts "i = #{i}"
  i += 1
end

# Example of for syntax usage
array = ['first', 'second', 'third']
for element in array
  puts element
end

# Example of break and each syntax usage
names = ['george', 'mike', 'gary', 'diana']
names.each do |name|
  if name == 'gary'
    puts('Break!')
    break
  end
  puts(name)
end

# Example of next syntax
names.each do |name|
  if name == 'gary'
    puts('Next!')
    next
  end
  puts(name)
end