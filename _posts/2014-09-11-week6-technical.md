---
layout: post
title: Ruby Variable Scope
      (a, $, @, @@, A)
week: 6
categories: technical
---
A variable scope simply means where in a program that a variable is accessible. Ruby has four type of variable scopes: local, instance, class, and global. Each is declared by using a special character before its name. Ruby also has one constant type variable. It is recommend to use snake_case for naming in Ruby.

Let's start with the most common variable type, local variables. Local variable MUST start with a lower case letter or with an underscore:

{% highlight ruby linenos=table %}
_Local_variable = "I'm outside the method."
local_variable = "I'm also outside the method."
p defined?(_Local_variable) # => "local-variable"
p defined?(local_variable)  # => "local-variable"
{% endhighlight %}

Local variables live inside the code block of its declaration. It's range varies from inside a class, a module, a method, a loop, or a block. Hence the name, living locally inside its scope of declaration. When an uninitialized (no value assigned) local variable is referenced, it will be interpreted as a call to a method that has no arguments.

{% highlight ruby linenos=table %}
local_variable = "I'm also outside the method."
def local
  local_variable = "I'm inside the method."
end

p local_variable  # => "I'm also outside the method."
p local           # => "I'm inside the method."
{% endhighlight %}

Next lets look at global variables. They are defined by prefixing '$' to its name. They must be initialized before using, otherwise it will produce an error. They are pretty much like the big brother/sister of local variables. They live inside the scope of a program. Regardless of where they are defined, they can be accessed anywhere from within the program. Be careful when using global variables, since they can be viewed and changed anywhere within a program, it will make tracking down bugs difficult.

{% highlight ruby linenos=table %}
$this_is_global = 10
p defined?($this_is_global) # => "global-variable"
def add_one
  $this_is_global += 1
end
def square_it
  $this_is_global ** 2
end
p $this_is_global # => 10
p add_one         # => 11
p square_it       # => 121
{% endhighlight %}

Now onto instance variables. Their names are prefixed with '@'. An uninitialized instance variable will have the value nil and produce an warning. They live inside a specific instance of a class. For example, a class that initializes its instances with a variable '@number'. Every object of this class will carry a copy of '@number'. These copies are independent from one another, meaning that the changes you made to one object's '@number' will not affect the others.

{% highlight ruby linenos=table %}
class SomeObject
  def initialize(one,two,three)
    @one = one
    @two = two
    @three = three
  end
  def display_value_type
    puts "value: #{@one}; type: #{defined?(@one)}."
    puts "value: #{@two}; type: #{defined?(@two)}."
    puts "value: #{@three}; type: #{defined?(@three)}."
  end
end

object_one = SomeObject.new(1,2,3)
object_one.display_value_type
# => value: 1; type: instance-variable.
# => value: 2; type: instance-variable.
# => value: 3; type: instance-variable.
{% endhighlight %}

Coming up is the class variable. They are declared with prefixing two '@' to its name like so: '@@variable'. Class variables must be initialized at creation, otherwise it will raise an error when referenced. They live inside a class and shared amongst all instances of the class, and all its descendants. Meaning that an instance, or an instance form its descendant makes a change to the global variable, its value is changed for other instance objects.

{% highlight ruby linenos=table %}
class Parent
  attr_reader :class_variable
  @@class_variable = 10
  def display_value_type
    puts "value: #{@@class_variable}; type: #{defined?(@@class_variable)}."
  end
end

class Child < Parent
  def increase_by(amount)
    @@class_variable += amount
  end
end

parent = Parent.new
parent.display_value_type
# => value: 10; type: class variable.
child = Child.new
child.display_value_type
# => value: 10; type: class variable.
child.increase_by(10)
child.display_value_type
# => value: 20; type: class variable.
parent.display_value_type
# => value: 20; type: class variable.
{% endhighlight %}

Lastly, constants. Constants are declared with an upper case letter. Constants may not be created inside methods, referencing to an uninitialized constant will raise an error. Like the name suggests, its value should not be changed once initialized. However, Ruby differs from many other programming languages that it will allow constant value to be changed after initialization and only produce a warning when doing so. Constants declared outside of a class or module have a global scope, while those declared within has the scope within the context of the class or module.

{% highlight ruby linenos=table %}
This_is_constant = "I'm a constant born outside of class."
class ConstantExample
  Another_constant = "I'm a constant born inside a class."
  def show_them
    puts "#{This_is_constant} type: #{defined?(This_is_constant)}."
    puts "#{Another_constant} type: #{defined?(Another_constant)}."
  end
end

example = ConstantExample.new
example.show_them
# => I'm a constant born outside a class. type: constant.
# => I'm a constant born inside a class. type: constant.
{% endhighlight %}