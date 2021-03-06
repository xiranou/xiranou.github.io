---
layout: post
title: Ruby Enumerable (#map)
week: 4
categories: technical
---
Ruby has built-in modules, which can be think of as containers or tool-boxes that stores methods. An enumerable method can be use by a class that has a defined <em>each</em>. You can also find out which class uses enumerable like so:

{% highlight ruby linenos=table %}
Array.included_modules #=> [Enumerable, Kernel]
Hash.included_modules #=> [Enumerable, Kernel]
{% endhighlight %}

The <em>map</em> belongs in the enumerable module and it is the non-destructive twin of <em>map!</em>(more on the evil twin later). It accepts an enumerable object, such as array or hash, and a block of code. It runs the block for each element inside the object. Since it is non-destructive, meaning it will not alter the object passed on it, the results from the block are stored inside a new array. Like so:

{% highlight ruby linenos=table %}
original_array = [1,2,3]
new_array = original_array.map{|element| element+=1}
original_array #=>[1,2,3]
new_array #=> [2,3,4]
{% endhighlight %}

As you can see from the example, the original array contains 3 elements, and passed on <em>map</em> with the block <em>element += 1</em>. The block is run by each element, increasing each by one, and stores the results inside a new array which we set to the variable: <em>new_array</em>, and the <em>original_array</em> stays intact.

Now onto the evil twin, <em>map!</em>. It does the same thing as <em>map</em>, but destructively. A destructive method will alerts the original object, instead of returning a new object, it returns the modified object.

{% highlight ruby linenos=table %}
original_array = [1,2,3]
new_array = original_array.map!{|element| element+=1}
original_array #=>[2,3,4]
new_array #=> [2,3,4]
{% endhighlight %}

From the example above we can see that <em>original_array</em> is being altered even if we set a variable to catch the results. It is replacing each element by the result return from the given block, and then returns self (the original_array). This also means that the variable <em>new_array</em> is pointing at the same object as <em>original_array</em>.