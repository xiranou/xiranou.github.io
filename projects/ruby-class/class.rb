class Rectangle
  attr_reader :length, :width
  # is the same as
  # def length
  #   @length
  # end
  # def width
  #   @width
  # end
  def initialize(length, width)
    @length = length
    @width = width
  end

  def perimeter
    (@length + @width) * 2
  end

  def area
    @length * @width
  end
end

# accepts two arguments
p Rectangle.instance_method(:initialize).arity == 2
# accepts no arguments
p Rectangle.instance_method(:perimeter).arity == 0
p Rectangle.instance_method(:area).arity == 0
# can only read but not write
p Rectangle.method_defined?(:length) == true
p Rectangle.method_defined?(:length=) == false
p Rectangle.method_defined?(:width) == true
p Rectangle.method_defined?(:width=) == false

rect_one = Rectangle.new(10,5)
rect_one.perimeter # =>  30
rect_one.area # =>  50
rect_one.length # =>  10
rect_one.width # =>  5


class Ruler
  def measurement(rectangle)
    "This rectangle has length of #{rectangle.length} and width of #{rectangle.width}."
  end
end

ruler = Ruler.new
ruler.measurement(rect_one) # =>  "This rectangle has length of 10 and width of 5."