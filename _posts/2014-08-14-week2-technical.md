---
layout: post
title: Inline vs Block vs Inline-Block
week: 2
categories: technical
---
Every HTML element can be consider as a box, a rectangle box. This is called the 'box model' in CSS. The display property in CSS determines how these boxes would behave. The most commonly used are inline, inline-block, and block.

<b>Inline</b>

Inline is the default property for elements like &lt;span&gt;, &lt;em&gt;, or &lt;img&gt;. They have no line breaks before or after them, thus making them sit between a string of text or other elements. An inline element respects left & right margins and padding, but not top & bottom. It doesn't accept width and height properties either. You can see in the picture below that the inline elements stay at the same height and width even if you specify them in the CSS.

{% highlight css linenos=table %}
div{
  border: 1px solid black;
  background-color: red;
  height: 100px;
  width: 100px;
  display: inline;}
{% endhighlight %}

![inline img](/img/week-2/inline.png)

<b>Block</b>

Container type HTML elements such as &lt;div&gt; &lt;article&gt; &lt;p&gt; or header elements (&lt;h1&gt;, &lt;h2&gt;, etc), have a default display property of 'block'. They force line breaks before and after them, so that they sit right on-top of each other. They respect margins and paddings from all sides and accepts width and height arguments. As you can see in the picture below, the block elements sit on-top of one another due to their line breaks. They accept the height and width properties as oppose to an inline element.

{% highlight css linenos=table %}
div{
  border: 1px solid black;
  background-color: red;
  height: 50px;
  width: 100px;
  display: block;}
{% endhighlight %}

![block img](/img/week-2/block.png)

<b>Inline-Block</b>

Lastly, the inline-block display property. Elements with this display property will not have line breaks before and after them, thus they will sit like an inline element: between other elements or a string of text. However, they will accept width, heights and margins & paddings from all sides like a block element. I'd like to think of them as the hybrid of inline & block, they sit next to each other like an inline element but do accept the height and width arguments.

{% highlight css linenos=table %}
div{
  border: 1px solid black;
  background-color: red;
  height: 100px;
  width: 100px;
  display: inline-block;}
{% endhighlight %}

![inline-block img](/img/week-2/inline-block.png)

You can use CSS to change the display property of HTML elements. This will help greatly when you want your divs to sit next to each-other, or your img tags to stack on-top of each other.