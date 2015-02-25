---
layout: post
title: Let's SORT stuff out!
week: 8
categories: technical
---
I decided to take on sorting as this week's technical blog topic. I've done some sorting algoritem in Ruby in the past, this gives me the chance to do a couple more. Enough talking, I like staring at the sorting animation on Wiki to get an idea how to write these codes, so let's just jump right into examples.

[Selection sort](http://en.wikipedia.org/wiki/Selection_sort)
----
Pretty animation:

![Selection animation](http://wiki.ibcsstudent.org/images/9/94/Selection-Sort-Animation.gif)

{% highlight ruby linenos=table %}
def selection_sort(arry)
  (0..(arry.size-1)).each do |i|
    (i..(arry.size-1)).each do |j|
      min = arry[i]
      if min >= arry[j]
        arry[i], arry[j] = arry[j], arry[i]
      end
    end
  end
  arry
end
{% endhighlight %}

[Insertion Sort](http://en.wikipedia.org/wiki/Insertion_sort)
---
Pretty animation:

![Insertion Sort](http://upload.wikimedia.org/wikipedia/commons/0/0f/Insertion-sort-example-300px.gif)

{% highlight ruby linenos=table %}
def insertion_sort(arry)
  (0..(arry.size-1)).each do |i|
    j = i - 1
    while j>=0
      if arry[i] < arry[j]
        arry[i],arry[j] = arry[j],arry[i]
      end
      j -= 1
    end
  end
  arry
end
{% endhighlight %}

Notice the similarity between selection and interstion sort?

[Bubble Sort](http://en.wikipedia.org/wiki/Bubble_sort)
---
Pretty animation:

![Bubble Animation](http://upload.wikimedia.org/wikipedia/commons/c/c8/Bubble-sort-example-300px.gif)

{% highlight ruby linenos=table %}
def bubble_sort(arry)
  sorted = false
  until sorted
    sorted = true
    (arry.size-1).times do |idx|
      if arry[idx] > arry[idx+1]
        arry[idx], arry[idx+1] = arry[idx+1], arry[idx]
        sorted = false
      end
    end
  end
  arry
end
{% endhighlight %}

[Quick Sort](http://en.wikipedia.org/wiki/Quicksort)
---
Pretty animation:

![Quick Animation](http://upload.wikimedia.org/wikipedia/commons/9/9c/Quicksort-example.gif)

{% highlight ruby linenos=table %}
def quick_sort arr
  return arr if arr.length <= 1
  middle = arr.pop
  less = arr.select { |x| x < middle }
  more = arr.select { |x| x >= middle }
  quick_sort(less) + [middle] + quick_sort(more)
end
{% endhighlight %}

[Merge Sort](http://en.wikipedia.org/wiki/Merge_sort)
---
Pretty animation:

![Merge Animation](http://upload.wikimedia.org/wikipedia/commons/c/cc/Merge-sort-example-300px.gif)

{% highlight ruby linenos=table %}
def merge_sort(array)
  return array if array.length <= 1
  middle_idx = array.length/2
  left = merge_sort(array[0, middle_idx])
  right = merge_sort(array[middle_idx..-1])
  merge(left, right)
end

def merge(left, right)
  return left if right.empty?
  return right if left.empty?
  if left.first < right.first
    [left.first] + merge(left[1..-1], right)
  else
    [right.first] + merge(left, right[1..-1])
  end
end
{% endhighlight %}

Merge_sort has a helper method `merge`, but it feels very similar to quick sort, don't you think?

<iframe width="560" height="315" src="//www.youtube.com/embed/es2T6KY45cA" frameborder="0" allowfullscreen></iframe>

Will probably update this post with more sorting algoritems once I figure out how to write them as codes.