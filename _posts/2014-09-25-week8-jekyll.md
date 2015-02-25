---
layout: post
title: Jekyll! A simple guide.
week: 8
categories: technical
tag: jekyll
---
So I've finally able to set up [Jekyll](http://jekyllrb.com/) and converted everything from my website. It took me a long while, but its worth it. Now my codes are a lot more organized. Things like making templates, layouts, syntax highlighting, and updating links had become much much easier for future posts and pages. As of right now, I'm writing this post in MarkDown! Pretty cool, huh? I've only scratched the bare surface of Jekyll, but do allow me give you a brief example on how to get Jekyll set up for your blog.

First of all, you need to install Jekyll. Assuming you already have Ruby 1.9.3 or up and Bundler installed, getting Jekyll will be as easy as getting any other Ruby gem, in your terminal:

{% highlight bash linenos=table %}
$ gem install jekyll
{% endhighlight %}

Now that Jekyll is installed (don't forget to `$ rbenv rehash` if you are using rbenv, since Jekyll is a gem that comes with its own commands), lets set up a boilerplate. `$ cd` to a directory of your desire and run the following in your terminal:

{% highlight bash linenos=table %}
$ jekyll new awesome_blog
{% endhighlight %}

Jekyll had created a boilerplate for you inside `awesome_blog`, lets go see what is in there. `$ cd awesome_blog` and you should see a list of folders and files. You can start building your site now.

First, lets look at `_config.yml`. This is where you set your [Jekyll Configurations](http://jekyllrb.com/docs/configuration/). The boilerplate already had some settings for you, all you need to do is to fill them up. Remember to leave `baseurl` alone if you don't have a host name. These will be store as data inside [Jekyll Variables](http://jekyllrb.com/docs/variables/) which we can use later.

Lets start creating an index page. Inside the `_includes` folder is where you would write your HTML layout for pages and posts. Inside the `head.html` (you can rename it to anything to like, but be clear on what it is, we will just assume you will use the same template layout for all your pages and posts), you can write down the HTML tags for the head in here:

{% highlight html linenos=table %}
{% raw %}
<head>
  <meta charset="UTF-8">
  <title>Awesome Site Title</title>
  <link rel="stylesheet" href=" {{"/css/main.css" | prepend: site.baseurl}} ">
</head>
{% endraw %}
{% endhighlight %}

This is just a basic HTML head that includes links to your CSS files, but notice those <code>{% raw %} {{site.baseurl}} {% endraw%}</code> ? They are [Liquid](http://liquidmarkup.org/) template language. Jekyll supports the use of Liquid and has many [variables](http://jekyllrb.com/docs/variables/) that you can use to access the data you need. For example, the above Liquid output will `prepend` the data in site.baseurl to `/css/main.css`, returning the full URL to your CSS file. Now your HTML for head is done, lets finish up with the header and footer as well and save them as `header.html` and `footer.html` inside `_includes`:

{% highlight html linenos=table %}
<header>
    <h1>{{page.title}}</h1>
</header>
{% endhighlight %}

{% highlight html linenos=table %}
<footer>
  <a href="mailto:{{ site.email }}">{{ site.email }}</a>
</footer>
{% endhighlight %}

After all that, lets go into `_layouts` folder and look inside `default.html`. This is where you tell Jekyll how you want the page to be layout. Let's delete everything in it and type the following:

{% highlight html linenos=table %}
{% raw %}
<!DOCTYPE html>
<html>
  {% include head.html %}
  <body>
    `{% include header.html %}`
    <div class="page-content">
      <div class="wrapper">
        {{ content }}
      </div>
    </div>
    {% include footer.html %}
  </body>
</html>
{% endraw %}
{% endhighlight %}

As you could've guessed, we used the Liquid Tag markup to `include` the HTML files we made for the head, header, and footer. Then we make the layout for the body and use the Liquid Output markup for the `content` (this is a Jekyll Variable that renders the contents inside a page or post, it is NOT DEFINED outside of the layout files.) we going to put for the index page.

Almost there! Now back to our `index.html`. We need to add what Jekyll calls [YAML Front Matter](http://jekyllrb.com/docs/frontmatter/). To put it simply, it is a block of variables and values that tells Jekyll how to build your site. It MUST take the form of valid YAML and set between TRIPLE-DASH-LINES:

{% highlight yaml linenos=table %}
---
layout: default
title: Home Page
___
<p>Hello, World!!!</p>
{% endhighlight %}

The YAML Front Matter tells Jekyll to build this page using the `default.html` layout we just created, and it's title is "Home Page". Run the command `$ jekyll serve` in your terminal, let Jekyll build the site and run a development server for you to preview your site. Go to `http://localhost:4000/` and you will see your new index page made with Jekyll.

Writing posts with Jekyll will be just as easy, and they can be written in markdown or textile formatted files. No more messy HTML tags to distract you from your creative world! One thing to remember is that Jekyll require posts to be inside `_posts` folder and REQUIRES them to be named in the following format:

{% highlight bash linenos=table %}
YEAR-MONTH-DAY-title.MARKUP
{% endhighlight %}

This is just the very basic of Jekyll, but I think it's enough to get you running. To me, using Jekyll feels like playing with Lego, building a head, a foot, a body then join them all together accordingly, and voilà, you now have a robot to play with! It's time for you to have some fun building your own blog with Jekyll.