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
  p 'way to heavy'
end