---
layout: post
title: Testing uniqueness with RSpec and shoulda-matchers
categories: technical
---
When testing uniqueness validations with shoulda-matcher in RSpec, an error could occur when the an attribute of the class also has a not null constrain on the database.

The `validate_uniqueness_of` method needs an instance in the database to work, if there's no instance in the database it creates one with the given attribute but doesn't set up the rest. It bypasses the rails' validation but not the database's.

One simple workabout (using FactoryGirl where the user factory has all the necessary attributes):

{% highlight ruby linenos=table %}
  it 'should validate the uniqueness of email' do
    create(:user)
    should validate_uniqueness_of(:email)
  end
{% endhighlight %}

Yup, that's it.