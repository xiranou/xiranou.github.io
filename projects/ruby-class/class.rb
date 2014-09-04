class Rectangle
  attr_reader :length, :width
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
p rect_one.length == 10
p rect_one.width == 5
p rect_one.perimeter == 30
p rect_one.area == 50
class Ruler
  def measurement(rectangle)
    "This rectangle has length of #{rectangle.length} and width of #{rectangle.width}."
  end
end

ruler = Ruler.new
p ruler.measurement(rect_one) == "This rectangle has length of 10 and width of 5."