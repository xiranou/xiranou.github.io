class Rectangle
  attr_reader :height, :width
  def initialize(height, width)
    @height = height
    @width = width
  end

  def perimeter
    (@height + @width) * 2
  end

  def area
    @height * @width
  end
end

# accepts two arguments
p Rectangle.instance_method(:initialize).arity == 2
# accepts no arguments
p Rectangle.instance_method(:perimeter).arity == 0
p Rectangle.instance_method(:area).arity == 0
# can only read but not write
p Rectangle.method_defined?(:height) == true
p Rectangle.method_defined?(:height=) == false
p Rectangle.method_defined?(:width) == true
p Rectangle.method_defined?(:width=) == false

rect_one = Rectangle.new(10,5)
p rect_one.perimeter == 30
p rect_one.area == 50