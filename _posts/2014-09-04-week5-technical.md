---
layout: post
title: Ruby, Class
week: 5
categories: technical
---
In object oriented programming(OOP), codes are written to model objects in the real world. Such object will have its own attributes and behaviors. While the state(data) within the object will set its attributes, the methods(codes) set the behaviors.

A class in OOP is simply the blueprint, a constructor for objects. While you create an object, it is an instance of its class. Say that you are creating a coin, an object that has attributes like shape, weight, height(maybe), the material it created from(colors, maybe), and the emblems on its head and tail. All these attribute can be grouped into a class, a blueprint for all coin creations, and each individual coin is an instance of this class. A coin has certain behaviors when it being carried in a pocket, spend in a transaction, or thrown high up in the air. All these actions will produce something according to the behaviors of the coin. How will a coin that has a weight of X behave while being toss? What can you exchange for with a dollar coin? These are essentially methods within the coin class that returns something when these actions are called for.

Object attributes set them apart from one another: a quarter is of different size, made of different material, has different weight and different emblems than a penny. Methods produce outcomes that is depended on the attributes of the coin object. How high can it be thrown? This behavior might be affected by the outside force, and also by the internal attribute: weight, which, in turn, can be determined by another internal attribute: material made. Similarity, how it is carried, or spend all follows this logic.

Now lets look at a simpler object, an rectangle. What does a rectangle have? 4 sides, 2 shorter ones we call the width and 2 longer ones we call length. How does it behave? Stuff can be put in it (determined by its area) and people can walk around it (determined by its perimeter).

The blueprint, a Rectangle class, has an initialize method that set the object's attributes: length and width. A method to calculate the perimeter and another to calculate the area. Within the initialize method we can see two variables with '@' before it. These are called instance-variables. They belong to the object that is being created. Since different objects will have different values for their attributes (quarter vs penny), these variables only belong to one particular object, an instance its class. They stay inside the scope of the instance.

{% highlight ruby linenos=table %}
class Rectangle
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
{% endhighlight %}

After a rectangle object is initialized. These instance-variables are ready to be used by methods within this class. Now you can call the methods that belongs to this class, in this case 'area' and 'perimeter', on the object. As you can see, both perimeter and area methods return outcomes that is determined by the value of the instance-variables.

{% highlight ruby linenos=table %}
rect_one = Rectangle.new(10,5)
rect_one.perimeter #=> 30
rect_one.area      #=> 50
{% endhighlight %}

Just like real-life objects, this rectangle can interact with other objects too. Recalled that the instance-variables are living inside the scope of the object, only a method that belongs to its class can gain access to them. So what if some other objects want to take a look at these variables? We will need to give our class a getter method that returns the desired instance-variable. This can be done by using attr_reader or actually write out the method.

{% highlight ruby linenos=table %}
class Rectangle
  attr_reader :length, :width
## is the same as ##
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

rect_one.length # =>  10
rect_one.width # =>  5
{% endhighlight %}

Now our rectangle object has methods that returns its instance-variables. Say we have a ruler object from a ruler class that has a method which will take a rectangle object as its argument, then call those two methods the rectangle and return the length and width values as a string.

{% highlight ruby linenos=table %}
class Ruler
  def measurement(rectangle)
    "This rectangle has length of #{rectangle.length} and width of #{rectangle.width}."
  end
end

ruler = Ruler.new
ruler.measurement(rect_one) # =>  "This rectangle has length of 10 and width of 5."
{% endhighlight %}

The ruler can get the measurements from our rectangle only because we allowed those instance-variables to be accessible via values returned by getter methods. Similarity, we can have the measurements of the rectangle object to be changed from outside of its class using 'attr_writer' (or a setter method) and even do both at the same time with 'attr_accessor' (both getter and setter method). However, we need to be careful when granting access to instance-variables since not every attribute of an object are meant to be written (or even read, think of a credit-card object) by an outside class.