# Environment Notes:
# 1) broke this out into standalone example file because overriding the
# Class new method jacks up how pry operates internally

# We can override the Class class to change object instantiation
# behavior. When Name.new is called to create a new object, the new
# method in Class is run by default followed by whatever the
# underlying class declares in its initialize method. This can be
# demonstrated by overriding new in Class:
class Class
  alias old_new new
  def new(*args)
    print "Creating a new ", self.name, "\n"
    old_new(*args)
  end
end

class Name
  def initialize
    p 'hello'
  end
end

n = Name.new
