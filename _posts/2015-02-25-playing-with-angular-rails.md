---
layout: post
title: Playing with AngularJS & Rails
categories: technical
---
So recently I'm learning AngularJS. A fun framework that extends HTML and lets you build applications with dynamic views. I've decided to play with Rails with AngularJS handling the client side.

Before we start, we need to remove turbolinks if your app has it. Turbolinks serve a similar purpose as Angular, but Angular can do so much more, and is much more fun that the ol'turbolinks. Remove the 'turbolinks' gem in your Gemfile, remove the two `"data-turbolinks-track" => true` hash key/value pairs from your 'app/views/layouts/application.html.erb' and remove the reference inside your JavaScript manifest.


First thing first, settup Angular in your Rails application. I've found some good tutorials online which I'll link below, but this is the fun stuff that I've found.

Setting up Angular is quite easy. First in your Gemfile add `gem 'bower-rails'`  and then run  `bundle install`. (If you don't have Node installed, you can run  `brew install node`  in your terminal and follow the instructions after intstallition.) This gem adds bower to your Rails application, which is a package manager for your front-end componenets such as Angular.

Next is to use the Rails generator from the 'bower-rails' gem to initilize bower-rails. Just run the command  `rails g bower_rails:initialize` . Now that a Bowerfile and a bower-rails initilizer will be created for you.

The Bowerfile is similar to a Gemfile. The author even makes it to have a similar syntax as a Gemfile. To add assets to the Bowerfile, simply add a line  `asset 'name-of-asset'` . So now we would add  `asset 'angular'`  to our Bowerfile and then run  `rake bower:install` . By default 'bower-rails' installs assets inside 'vender/assets/bower-components', and that isn't the Rails standard, we would need to add some configurations in the 'config/application.rb' file.

Inside the 'config/application.rb' file, all we need to do to add 'bower-components' to the assets path is to add this line `config.assets.paths << Rails.root.join("vendor","assets","bower_components")` under YourApp::Application. This tells Rails to also looking into the 'bower_components' folder when find assets.

Lastly, add the reference to your JavaScript manifest. If you look into the 'bower_components' folder you will see that the file 'angular.js' and 'angular.min.js' lives inside the 'angular' folder. So when you create the reference, make sure it is  `//= require angular/angular`  or  `//= require angular/angular.min`  if you want to use the minfiy version.

And that's it. Angular is all set up!